(* Again: filesystem *)

type 'a option = None | Some of 'a

let not b =
  match b with
  | true -> false
  | false -> true

let (>) a b = b < a
let (<=) a b = not (b < a)
let (>=) a b = not (a < b)

let noinline =
  let rec block f a = let _ = block in f a in block

(* list ops *)

let rec length xs =
  match xs with
  | [] -> 0
  | _::xs -> (+) 1 (length xs)

let rec rev_onto acc xs =
  match xs with
  | [] -> acc
  | x::xs -> rev_onto (x :: acc) xs

let rev xs = rev_onto [] xs

let (@) xs ys = rev_onto ys (rev xs)

(* string ops *)

let implode = noinline (fun xs ->
  let b = make_bytes (length xs) in
  let rec loop i xs =
    match xs with
    | [] -> ()
    | x::xs -> set_bytes b i x; loop (i+1) xs
  in
  loop 0 xs;
  freeze_bytes b)

let rev_implode = noinline (fun xs ->
  let n = length xs in
  let b = make_bytes n in
  let rec loop i xs =
    match xs with
    | [] -> ()
    | x::xs -> set_bytes b i x; loop (i-1) xs
  in
  loop (n-1) xs;
  freeze_bytes b)

let explode = noinline (fun s ->
  let rec explode_loop acc i =
    if i < 0 then acc else
      explode_loop (string_index s i :: acc) (i-1)
  in
  explode_loop [] (string_length s - 1))

let eq_string = noinline (fun s1 s2 ->
  let n1 = string_length s1 in
  let n2 = string_length s2 in
  if not (n1 = n2) then false else
    let rec loop i =
      if i < 0 then true else
        let c1 = string_index s1 i in
        let c2 = string_index s2 i in
        if not (eq_char c1 c2) then false else loop (i-1)
    in
    loop (n1-1))

let (^) s1 s2 =
  implode (explode s1 @ explode s2)

let concat = noinline (fun sep ->
  let sep = explode sep in
  let rec collect acc xs =
    match xs with
    | [] -> implode acc
    | x::xs -> collect (explode x @ sep @ acc) xs
  in
  fun xs0 ->
  match rev xs0 with
  | [] -> ""
  | last::xs -> collect (explode last) xs)

(* int ops *)

let chars_of_int i =
  let ord0 = ord '0' in
  let char_of_digit c = chr (ord0 + c) in
  let rec loop acc i =
    if i = 0 then acc else
      loop (char_of_digit (i%10) :: acc) (i/10)
  in
  if i = 0 then ['0'] else
    if i < 0 then '-' :: loop [] (0 - i) else
      loop [] i

let sofi = noinline (fun i -> implode (chars_of_int i))

let parse_digit c =
  let n = ord c - ord '0' in
  if n >= 0 then if n <= 9 then Some n else None else None

let parse_num = noinline (fun s ->
  let rec loop acc xs =
    match xs with
    | [] -> Some(acc)
    | x::xs ->
        match parse_digit x with
        | None -> None
        | Some d -> loop (10 * acc + d) xs
  in
  loop 0 (explode s))

(* IO *)

let rec put_chars xs =
  match xs with
  | [] -> ()
  | x::xs -> put_char x; put_chars xs

let put_string s = put_chars (explode s)

let newline () = put_char '\n'

(* read_line *)

let erase_char () =
  let backspace = chr 8 in
  (* erase the previously echoed char on the terminal *)
  put_char backspace;
  put_char ' ';
  put_char backspace

let read_line () =
  let rec readloop acc =
    let c = get_char () in
    let n = ord c in
    let controlD = chr 4 in
    if eq_char c '\n' then (newline(); rev_implode acc) else
      if eq_char c controlD then (put_char controlD; newline(); rev_implode (controlD :: acc)) else
        if n > 127 then readloop acc else
          if n = 127 then
            match acc with
            | [] -> readloop acc
            | c::tail ->
               (if ord c <= 26 then erase_char () else ()); (* The ^ printed for control chars *)
               erase_char();
               readloop tail
          else
            (put_char c; readloop (c :: acc))
  in
  readloop []

let split_words =
  let rec at_word_start accWs =
    let rec have_letter accWs accCs xs =
      match xs with
      | [] -> rev_implode accCs :: accWs
      | x::xs ->
         if eq_char x ' ' then at_word_start (rev_implode accCs :: accWs) xs
         else have_letter accWs (x::accCs) xs
    in
    fun xs ->
    match xs with
    | [] ->  accWs
    | x::xs ->
       if eq_char x ' ' then at_word_start accWs xs else
         have_letter accWs [x] xs
  in
  fun s -> rev (at_word_start [] (explode s))

type ('a,'b) pair = Pair of 'a * 'b

type command = Command of (string list -> unit)

type cmap = Cmap of (string,command) pair list
let deCmap thing = match thing with | Cmap x -> x

let lookup : string -> cmap -> command option = fun sought ->
  let rec loop ps =
    match ps with
    | [] -> None
    | e1::ps ->
       match e1 with
       | Pair (name,command) ->
          if eq_string name sought then Some command else loop ps
  in
  fun cmap -> loop (deCmap cmap)

let error mes = put_string ("Error: " ^ mes ^ "\n")

let my_assert : bool -> unit = fun b -> if b then () else error "assert failed"

let trace_on = true

let trace = noinline (fun m -> if trace_on then put_string ("trace: " ^ m ^ "\n") else ())

(* Wrap the load/store-sector builtins with error checking & messages *)

let prim_load_sector : int -> bytes -> unit = noinline (fun seci buf ->
  let () = trace ("(SLOW) load_sector " ^ sofi seci) in
  load_sector seci buf)

let prim_store_sector : int -> string -> unit = noinline (fun seci s ->
  let () = trace ("(SLOW) store_sector " ^ sofi seci) in
  store_sector seci s)

let set_slice_bytes : bytes -> int -> int -> bytes -> unit = (* pwrite? *)
  noinline (fun target offset len source ->
  let tlen = string_length (freeze_bytes target) in
  let slen = string_length (freeze_bytes source) in
  let info() = trace ("set_slice_bytes: #target=" ^ sofi tlen ^ ", offset=" ^ sofi offset ^ ", len=" ^ sofi len ^ ", #source=" ^ sofi slen) in
  let err() = info(); error "set_slice_bytes" in
  if not (slen = len) then err() else
  if offset < 0 then err() else
  if len < 0 then err() else
  if offset+len > tlen then err() else
  let rec loop i =
    if i >= len then () else
      let char = get_bytes source i in
      let () = set_bytes target (offset+i) char in
      loop (i+1)
  in
  loop 0)

let get_slice_bytes : bytes -> int -> int -> string = (* pread? *)
  noinline (fun source offset len ->
  let target = make_bytes len in
  let rec loop i =
    if i >= len then () else
      let char = get_bytes source (offset+i) in
      set_bytes target i char;
      loop (i+1)
  in
  loop 0;
  freeze_bytes target)

(* Sector... *)

let sector_size = 512
let num_sectors = 32

let bad_sector_index seci = if seci < 0 then true else seci >= num_sectors

let load_sector : int -> bytes -> bool = noinline (fun seci buf ->
  if bad_sector_index seci then (error ("load_sector " ^ sofi seci); false) else
    let () = prim_load_sector seci buf in
    true)

let store_sector : int -> string -> unit = noinline (fun seci s ->
  if bad_sector_index seci then error ("store_sector " ^ sofi seci) else
    prim_store_sector seci s)

let update_sector : int -> int -> int -> string -> unit =
  noinline (fun seci offset len text ->
  (*let () = trace ("update_sector seci=" ^ sofi seci ^ ", offset=" ^ sofi offset ^ ", len=" ^ sofi len) in*)
  if bad_sector_index seci then error ("update_sector " ^ sofi seci) else
    let buf = make_bytes sector_size in
    let () = prim_load_sector seci buf in
    let () = set_slice_bytes buf offset len (thaw_bytes text) in
    let () = prim_store_sector seci (freeze_bytes buf) in
    ())

let read_sector : int -> string option =
  fun seci ->
  let buf = make_bytes sector_size in
  let ok = load_sector seci buf in
  if not ok then None else Some (freeze_bytes buf)

let is_printable c =
  let n = ord c in
  if n < 32 then false else n < 127

let put_sector : string -> unit = fun s ->
  let rec loop i =
    if i >= 512 then () else
      let c = string_index s i in
      let c = if is_printable c then c else '.' in
      (put_char c;
       (if i % 64 = 63 then newline() else ());
       loop (i+1))
  in
  loop 0

let read_sector_show : int -> unit =
  fun seci ->
  match read_sector seci with
  | None -> ()
  | Some s -> put_sector s

let fill_sector : int -> char -> unit =
  fun seci char ->
  let buf = make_bytes sector_size in
  let rec loop i =
    if i >= sector_size then () else
      (set_bytes buf i char; loop (i+1))
  in
  loop 0;
  store_sector seci (freeze_bytes buf)

(* blocks: normally would be sized as some multiple of sectors, but my blocks are smaller *)

let block_size = 64
let blocks_per_sector = 8
let () = my_assert (block_size * blocks_per_sector = sector_size)

let num_blocks = blocks_per_sector * num_sectors
let () = my_assert (num_blocks = 256)

type block = Block of string
let deBlock thing = match thing with | Block x -> x

let bad_block_index i = if i < 0 then true else i >= num_blocks

let show_seci seci = "[" ^ sofi seci ^ "]"

let read_block : int -> block option = noinline (fun i ->
  if bad_block_index i then (error ("read_block " ^ sofi i); None) else
    let seci = i / blocks_per_sector in
    let () = trace ("read_block " ^ sofi i ^ show_seci seci) in
    match read_sector (i / blocks_per_sector) with
    | None -> None
    | Some sector ->
       let offset = block_size * (i % blocks_per_sector) in
       Some (Block (get_slice_bytes (thaw_bytes sector) offset block_size)))

let store_block : int -> block -> unit = noinline (fun i block ->
  if bad_block_index i then error ("store_block " ^ sofi i) else
    let seci = i / blocks_per_sector in
    let () = trace ("store_block " ^ sofi i ^ show_seci seci) in
    let offset = block_size * (i % blocks_per_sector) in
    update_sector seci offset block_size (deBlock block))

let read_block_show : int -> unit =
  fun i ->
  match read_block i with
  | None -> ()
  | Some b -> (put_string (deBlock b); newline())

let fill_block : int -> char -> unit =
  fun blocki char ->
  let buf = make_bytes block_size in
  let rec loop i =
    if i >= block_size then () else
      (set_bytes buf i char; loop (i+1))
  in
  loop 0;
  store_block blocki (Block (freeze_bytes buf))

let update_block : int -> int -> string -> unit = noinline (fun i offset text ->
  (*let () = trace ("update_block i=" ^ sofi i ^ ", offset=" ^ sofi offset ^ ", len=" ^ sofi len) in*)
  if bad_block_index i then error ("update_block " ^ sofi i) else
    match read_block i with
    | None -> ()
    | Some block ->
       let buf = thaw_bytes (deBlock block) in
       let () = set_slice_bytes buf offset (string_length text) (thaw_bytes text) in
       let () = store_block i (Block (freeze_bytes buf)) in
       ())

(* Commands.. *)

(* This parsing take way too much effort/code... perhaps some parsing combinators would be nice :) *)

let rs : command =
  let err() = error "rs: bad args" in
  Command (fun args ->
      match args with
      | [] -> err()
      | arg1::args ->
         match args with
         | _::_ -> err()
         | [] ->
            match parse_num arg1 with
            | None -> err()
            | Some seci -> read_sector_show seci)

let fs : command =
  let err() = error "fs: bad args" in
  Command (fun args ->
      match args with
      | [] -> err()
      | arg1::args ->
         match args with
         | [] -> err()
         | arg2::args ->
            match args with
            | _::_ -> err()
            | [] ->
               match parse_num arg1 with
               | None -> err()
               | Some seci ->
                  match explode arg2 with
                  | [] -> err()
                  | c::cs ->
                     match cs with
                     | _::_ -> err()
                     | [] -> fill_sector seci c)

let rb : command =
  let err() = error "rb: bad args" in
  Command (fun args ->
      match args with
      | [] -> err()
      | arg1::args ->
         match args with
         | _::_ -> err()
         | [] ->
            match parse_num arg1 with
            | None -> err()
            | Some blocki -> read_block_show blocki)

let fb : command =
  let err() = error "fb: bad args" in
  Command (fun args ->
      match args with
      | [] -> err()
      | arg1::args ->
         match args with
         | [] -> err()
         | arg2::args ->
            match args with
            | _::_ -> err()
            | [] ->
               match parse_num arg1 with
               | None -> err()
               | Some blocki ->
                  match explode arg2 with
                  | [] -> err()
                  | c::cs ->
                     match cs with
                     | _::_ -> err()
                     | [] -> fill_block blocki c)


let ub : command =
  let err() = error "ub: bad args" in
  Command (fun args ->
      match args with
      | [] -> err()
      | arg1::args ->
         match args with
         | [] -> err()
         | arg2::args ->
            match parse_num arg1 with
            | None -> err()
            | Some blocki ->
               match parse_num arg2 with
               | None -> err()
               | Some offset ->
                  let text = concat " " args in
                  update_block blocki offset text)


let the_command_map : cmap =
  Cmap
    [ Pair ("rs",rs)
    ; Pair ("fs",fs)
    ; Pair ("rb",rb)
    ; Pair ("fb",fb)
    ; Pair ("ub",ub)
    ]

let execute : string -> unit = fun line ->
  match split_words line with
  | [] -> ()
  | arg0::args ->
     match lookup arg0 the_command_map with
     | None -> error (arg0 ^ " : command not found")
     | Some command ->
        match command with
        | Command f -> f args

let prompt i = put_string (sofi i ^ "> ")

let rec repl i =
  prompt i;
  let line = read_line() in
  execute line;
  repl (i+1)

let main () =
  put_string "Filesystem test shell\n";
  repl 1
