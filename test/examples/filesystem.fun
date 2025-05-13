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
  | _::xs -> 1 + length xs

let rec drop n xs =
  if n <= 0 then xs else
    match xs with
    | [] -> []
    | _::xs -> drop (n-1) xs

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

let min x y = if x < y then x else y

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

let error mes = put_string ("Error: " ^ mes ^ "\n")

let _my_assert : bool -> unit = fun b -> if b then () else error "assert failed"

let trace_on = ref false

let trace = noinline (fun m -> if !trace_on then put_string ("trace: " ^ m ^ "\n") else ())

let with_no_trace f =
  let old = !trace_on in
  trace_on := false;
  f ();
  trace_on := old

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

let get_slice_bytes : string -> int -> int -> string = (* pread? *)
  noinline (fun source offset len ->
  let slen = string_length source in
  let info() = trace ("get_slice_bytes: #source=" ^ sofi slen ^ ", offset=" ^ sofi offset ^ ", len=" ^ sofi len) in
  info();
  let target = make_bytes len in
  let rec loop i =
    if i >= len then () else
      let char = string_index source (offset+i) in
      set_bytes target i char;
      loop (i+1)
  in
  loop 0;
  freeze_bytes target)

(* Sector... *)

let sector_size = 512
let num_sectors = 3 (*32*) (* keep this small for dev; easy to see fully dump *)

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
      let c = if eq_char c '\n' then '$' else if is_printable c then c else '.' in
      (put_char c;
       (if i % 64 = 63 then newline() else ());
       loop (i+1))
  in
  loop 0

let make_fill_sector char =
  let buf = make_bytes sector_size in
  let rec loop i =
    if i >= sector_size then () else
      (set_bytes buf i char; loop (i+1))
  in
  loop 0;
  freeze_bytes buf

let read_sector_show : int -> unit =
  fun seci ->
  match read_sector seci with
  | None -> ()
  | Some s -> put_sector s

(* blocks: normally would be sized as some multiple of sectors, but my blocks are smaller *)

let block_size = 64
let blocks_per_sector = 8
let () = _my_assert (block_size * blocks_per_sector = sector_size)

let num_blocks = blocks_per_sector * num_sectors
(*let () = assert (num_blocks = 256)*)

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
       Some (Block (get_slice_bytes sector offset block_size)))

let store_block : int -> block -> unit = noinline (fun i block ->
  if bad_block_index i then error ("store_block " ^ sofi i) else
    let seci = i / blocks_per_sector in
    let () = trace ("store_block " ^ sofi i ^ show_seci seci) in
    let offset = block_size * (i % blocks_per_sector) in
    update_sector seci offset block_size (deBlock block))

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

type target = Target of ((*block indexes*) int list * (*offset*) int)
type source = Source of (string * (*offset*) int * (*len*) int)

let sof_target t = match t with
  | Target (bis,offset) ->
     "[target:#blocks=" ^ sofi (length bis) ^ ", offset=" ^ sofi offset ^ "]"

let sof_source s = match s with
  | Source (str,offset,len) ->
     "[source:#str=" ^ sofi (string_length str) ^ ", offset=" ^ sofi offset ^ ", len=" ^ sofi len ^ "]"

let extract_source : source -> string = fun source ->
  match source with
  | Source (text,offset,len) ->
     get_slice_bytes text offset len

let trunc_source : source -> int -> source = fun s n ->
  if n < 0 then (error "trunc_source"; s) else
    match s with
    | Source (text,offset,_) ->
       Source (text,offset,n)

let seek_source : source -> int -> source = fun s n ->
  if n < 0 then (error "seek_source"; s) else
    match s with
    | Source (text,offset,len) ->
       Source (text,offset+n, len-n)

let rec write_blocks target source =
  let info() = trace ("write_blocks: " ^ sof_target target ^ " <- " ^ sof_source source) in
  info();
  match target with
  | Target (bis,toff) ->
     if toff >= 64 then error "write_blocks:toff>=64" else
       match source with
       | Source (_,_,len) ->
          if len < 0 then error "write_blocks:len<0"  else
            if len <= 0 then () else
              match bis with
              | [] -> error "write_blocks: not enough blocks"
              | bi1::bisR ->
                 let space1 = block_size - toff in
                 _my_assert (space1 > 0);
                 let n1 = min space1 len in
                 let text1 = extract_source (trunc_source source n1) in
                 let () = update_block bi1 toff text1 in
                 let sourceR = seek_source source n1 in
                 write_blocks (Target (bisR,0)) sourceR

(* proto inodes *)

let block_indexes_of_inode : int -> int list = fun i ->
  if i = 1 then [5;6;7;8;9] else
    if i = 2 then [11;12;13;14;15;16;17] else
      (error "block_indexes_of_inode"; [])


(* Commands.. *)

type command = Command of (string list -> unit)

let exec : command -> string list -> unit = fun command args ->
  match command with
  | Command f -> f args

type cmap = Cmap of (string,command) pair list
let deCmap thing = match thing with | Cmap x -> x

let keys : cmap -> string list =
  let rec loop acc ps =
    match ps with
    | [] -> rev acc
    | e1::ps ->
       match e1 with
       | Pair (name,_) -> loop (name::acc) ps
  in
  fun cmap -> loop [] (deCmap cmap)

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

(* This parsing take way too much effort/code... perhaps some parsing combinators would be nice :) *)

let wipe_everything : command =
  let err() = error "wipe_everything: bad args" in
  let commas = make_fill_sector ',' in
  Command (fun args ->
      match args with
      | _ :: _ -> err()
      | [] ->
         let rec loop i =
           if i >= num_sectors then () else
             let () = store_sector i commas
             in loop (i+1)
         in
         loop 0)

let dump_everything : command =
  let err() = error "dump_everything: bad args" in
  Command (fun args -> with_no_trace (fun () ->
      match args with
      | _ :: _ -> err()
      | [] ->
         let rec loop i =
           if i >= num_sectors then () else
             let () = read_sector_show i
             in loop (i+1)
         in
         loop 0))

(*let write_inode : int -> int -> string -> unit =
  noinline (fun ii offset text ->
      let bis = block_indexes_of_inode ii in
      write_blocks (Target (bis,offset)) (Source (text,0,string_length text)))

let com_write_inode : command =
  let err() = error "write_inode: bad args" in
  Command (fun args ->
      match args with
      | [] -> err()
      | arg1::args ->
         match parse_num arg1 with
         | None -> err()
         | Some ii ->
            let offset = 60 in (* hack fixed offset for the moment *)
            let text = concat " " args in
            write_inode ii offset text)*)

let com_create_inode : command =
  let controlD = chr 4 in
  let err() = error "create_inode: bad args" in
  Command (fun args ->
      match args with
      | [] -> err()
      | arg1::args ->
         match args with
         | _::_ -> err()
         | [] ->
            match parse_num arg1 with
            | None -> err()
            | Some ii ->
               let rec loop bis offset =
                 let text = read_line () in
                 let n = string_length text in
                 let stop = if n < 1 then false else eq_char (string_index text (n - 1)) controlD in
                 let text = if stop then text else text ^ "\n" in
                 let n = if stop then n-1 else n+1 in (* loose ^D or add \n *)
                 let () = write_blocks (Target (bis,offset)) (Source (text,0,n)) in
                 let () = exec dump_everything [] in
                 if stop then () else
                   let offset = offset + string_length text in
                   let bis = drop (offset / block_size) bis in
                   let offset = offset % block_size in
                   loop bis offset
               in
               let bis = block_indexes_of_inode ii in
               loop bis 0)

let the_command_map : cmap =
  Cmap
    [ Pair ("wipe",wipe_everything)
    ; Pair ("dump",dump_everything)
    (*    ; Pair ("write",com_write_inode)*)
    ; Pair ("create",com_create_inode)
    ]

let execute : string -> unit = fun line ->
  match split_words line with
  | [] -> ()
  | arg0::args ->
     match lookup arg0 the_command_map with
     | None -> error (arg0 ^ " : command not found")
     | Some command -> exec command args

let prompt i = put_string (sofi i ^ "> ")

let rec repl i =
  prompt i;
  let line = read_line() in
  execute line;
  repl (i+1)

let main () =
  let coms = keys the_command_map in
  put_string ("Filesystem test shell [commands: " ^ concat " " coms ^ "]\n");
  repl 1
