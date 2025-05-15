(* More filesystem stuff -- inodes -- it's getting close! *)

type 'a option = None | Some of 'a

let is_some o = match o with | None -> false | Some _ -> true

type ('a,'b) pair = Pair of 'a * 'b

let not b =
  match b with
  | true -> false
  | false -> true

let (>) a b = b < a
let (<=) a b = not (b < a)
let (>=) a b = not (a < b)

let noinline = let rec block f a = let _ = block in f a in block


(* list ops *)

let rec length xs =
  match xs with
  | [] -> 0
  | _::xs -> 1 + length xs

let rec map f xs =
  match xs with
  | [] -> []
  | x::xs -> f x :: map f xs

let rec filter p xs =
  match xs with
  | [] -> []
  | x::xs -> if p x then x :: filter p xs else filter p xs

let rec foldl f acc xs =
  match xs with
  | [] -> acc
  | x::xs -> foldl f (f acc x) xs

let rec iter f xs =
  match xs with
  | [] -> ()
  | x::xs -> (f x;iter f xs)

let rec upto a b =
  if a > b then [] else a :: upto (a+1) b

let rec take n xs =
  if n <= 0 then [] else
    match xs with
    | [] -> []
    | x::xs -> x :: take (n-1) xs

let rec _drop n xs =
  if n <= 0 then xs else
    match xs with
    | [] -> []
    | _::xs -> _drop (n-1) xs

let rec rev_onto acc xs =
  match xs with
  | [] -> acc
  | x::xs -> rev_onto (x :: acc) xs

let rev xs = rev_onto [] xs

let (@) xs ys = rev_onto ys (rev xs)

let list_diff : ('a -> 'a -> bool) -> 'a list -> 'a list -> 'a list = fun eq xs ys ->
  let list_rm xs y =
    let p x = not (eq x y) in
    filter p xs
  in
  foldl list_rm xs ys

(* string ops *)

let explode = noinline (fun s ->
  let rec explode_loop acc i =
    if i < 0 then acc else
      explode_loop (string_index s i :: acc) (i-1)
  in
  explode_loop [] (string_length s - 1))

let implode = noinline (fun xs ->
  let b = make_bytes (length xs) in
  let rec loop i xs =
    match xs with
    | [] -> ()
    | x::xs -> set_bytes b i x; loop (i+1) xs
  in
  loop 0 xs;
  freeze_bytes b)

let (^) s1 s2 =
  implode (explode s1 @ explode s2)

(* int ops *)

let max x y = if x < y then y else x

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

(* IO *)

let put_char c = (* A prettier put_char for control chars *)
  let backspace = 8 in
  let n = ord c in
  if n = backspace then put_char c else
    if eq_char c '\n' then put_char c else
      if n > 26 then put_char c else
        (put_char '^'; put_char (chr (ord 'A' + n - 1 )))

let rec put_chars xs =
  match xs with
  | [] -> ()
  | x::xs -> put_char x; put_chars xs

let put_string s = put_chars (explode s)

let newline () = put_char '\n'

(* trace *)

let trace_on = ref false

let trace = noinline (fun m -> if !trace_on then put_string ("trace: " ^ m ^ "\n") else ())

(*let trace1 = noinline (fun m -> put_string ("trace1: " ^ m ^ "\n"))*)

(*let with_no_trace f = (* TODO: silly? *)
  let old = !trace_on in
  trace_on := false;
  let res = f () in
  trace_on := old;
  res*)
let with_no_trace f = f ()

let make_bytes who n =
  trace ("make_bytes/" ^ who);
  make_bytes n

let rev_implode = noinline (fun xs ->
  let n = length xs in
  let b = make_bytes "rev_implode" n in
  let rec loop i xs =
    match xs with
    | [] -> ()
    | x::xs -> set_bytes b i x; loop (i-1) xs
  in
  loop (n-1) xs;
  freeze_bytes b)

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

let fill_string : int -> char -> string = fun n char ->
  let buf = make_bytes "fill_string" n in
  let rec loop i =
    if i >= n then () else
      (set_bytes buf i char; loop (i+1))
  in
  loop 0;
  freeze_bytes buf

let padR : int -> char -> string -> string = fun n char str ->
  let len = string_length str in
  let i = n-len in
  if i <= 0 then str else str ^ fill_string i char

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

(* inode/fs...*)

let sector_size = 512
let num_sectors_on_disk = 3 (* 31 is max here; if 32 we get 8*32=256 blocks, which is too big for a char *)

let block_size = 64
let blocks_per_sector = 8
let () = assert (block_size * blocks_per_sector = sector_size)

let num_blocks_on_disk = blocks_per_sector * num_sectors_on_disk

let substr : int -> string -> int -> int -> string =
  noinline (fun who source offset len ->
  trace ("substr/" ^ sofi who ^ " source=[" ^ source ^ "], offset=" ^ sofi offset ^ " ,len=" ^ sofi len);
  let target = make_bytes ("substr/"^sofi who) len in
  let slen = string_length source in
  assert (offset >= 0);
  assert (offset+len <= slen);
  let rec loop i =
    if i >= len then () else
      let char = string_index source (offset+i) in
      set_bytes target i char;
      loop (i+1)
  in
  loop 0;
  freeze_bytes target)

let mod_substr : bytes -> int -> string -> unit =
  noinline (fun target offset source ->
  let slen = string_length source in
  let tlen = string_length (freeze_bytes target) in
  assert (offset >= 0);
  assert (offset+slen <= tlen);
  let rec loop i =
    if i >= slen then () else
      let char = string_index source i in
      let () = set_bytes target (offset+i) char in
      loop (i+1)
  in
  loop 0)

(* block index; inode index... *)

type bi = BI of int
let deBI x = match x with | BI y -> y

let export_bi : bi -> char = fun bi -> chr (deBI bi)
let import_bi : char -> bi = fun c -> BI (ord c)

let show_bi : bi -> string = fun bi -> "B" ^ sofi (deBI bi)

let eq_bi : bi -> bi -> bool = fun x y -> deBI x = deBI y

type ii = II of int
let deII x = match x with | II y -> y

let show_ii : ii -> string = fun ii -> "I" ^ sofi (deII ii)

type block = Block of string (* always length 64 *)
let deBlock x = match x with | Block y -> y

(* sectors... *)

let load_sector : int -> bytes -> unit = fun seci buf ->
  assert (seci >= 0);
  assert (seci < num_sectors_on_disk);
  (*let () = trace ("(SLOW) load_sector " ^ sofi seci) in*)
  load_sector seci buf

let read_sector : int -> string =
  fun seci ->
  let buf = make_bytes "rs" sector_size in
  let () = load_sector seci buf in
  freeze_bytes buf

let put_sector : string -> unit = fun s ->
  let rec loop i =
    if i >= 512 then () else
      let c = string_index s i in
      (if eq_char c '\n' then put_string "\\n" else put_char c;
       (if i % 64 = 63 then newline() else ());
       loop (i+1))
  in
  loop 0

let update_sector : int -> int -> string -> unit =
  fun seci offset text ->
  let buf = make_bytes "us" sector_size in
  let () = load_sector seci buf in
  let () = mod_substr buf offset text in
  let () = store_sector seci (freeze_bytes buf) in
  ()

let read_sector_show : int -> unit =
  fun seci ->
  put_sector (read_sector seci)

let wipe_everything () =
  let commas = fill_string sector_size ',' in
  let rec loop i =
    if i >= num_sectors_on_disk then () else
      let () = store_sector i commas
      in loop (i+1)
  in
  loop 0

let dump_everything () = with_no_trace (fun () ->
  let rec loop i =
    if i >= num_sectors_on_disk then () else
      let () = read_sector_show i
      in loop (i+1)
  in
  loop 0)


(* TODO: last sector caching! -- have code for this*)

(* blocks... *)

let show_seci seci = "[" ^ sofi seci ^ "]"

let store_block : bi -> block -> unit = fun bi block ->
  let i = deBI bi in
  assert (i >= 0);
  assert (i < num_blocks_on_disk);
  let seci = i / blocks_per_sector in
  let () = trace ("store_block " ^ sofi i ^ show_seci seci) in
  let offset = block_size * (i % blocks_per_sector) in
  update_sector seci offset (deBlock block)

let load_block : bi -> block = fun bi ->
  let i = deBI bi in
  assert (i >= 0);
  assert (i < num_blocks_on_disk);
  let seci = i / blocks_per_sector in
  let () = trace ("load_block " ^ sofi i ^ show_seci seci) in
  let sector = read_sector (i / blocks_per_sector) in
  let offset = block_size * (i % blocks_per_sector) in
  Block (substr 1 sector offset block_size)

let update_block : bi -> int -> string -> unit =
  fun bi offset text ->
  trace ("update_block, bi=" ^ show_bi bi ^ ", offset=" ^ sofi offset ^ " text=[" ^ text ^ "]");
  let block = load_block bi in
  let buf = thaw_bytes (deBlock block) in
  let () = mod_substr buf offset text in
  store_block bi (Block (freeze_bytes buf))


let idata_size = 8
let inodes_per_block = block_size / idata_size
let () = assert (inodes_per_block = 8)
let max_blocks_per_inode = 6
let max_file_size = max_blocks_per_inode * block_size
let () = assert (max_file_size = 384)


(* inode info: size/blocks; exports as 8 bytes on disk *)

type inode = Inode of (int * bi list) (* size and list(max#=6) blocks *)

let ii2bi : ii -> bi = fun ii -> BI (deII ii / inodes_per_block + 1)
let ii2off : ii -> int = fun ii -> (deII ii % inodes_per_block) * idata_size

(* the size int in exported little endian *)
let export_int : int -> (char,char) pair =
  fun n ->
  assert (n <= max_file_size);
  let i = n / 256 in
  let j = n % 256 in
  Pair (chr j, chr i)

let import_int : (char,char) pair -> int =
  fun p ->
  match p with
  | Pair(lo,hi) ->
     let i = ord hi in
     let j = ord lo in
     assert (i <= max_file_size/256); (* TODO: this blows if a mounted file system is wiped! & then we ls *)
     256*i + j

let export_unallocated_inode : string =
  match export_int 0 with
  | Pair (lo,hi) ->
     implode [lo;hi]

let show_inode : inode -> string =
  fun inode ->
  match inode with
  | Inode (size,bis) ->
     "Inode: size=" ^ sofi size ^ ", blocks=[" ^ concat "," (map show_bi bis) ^ "]"

let size_of_inode : inode -> int =
  fun inode ->
  match inode with
  | Inode (size,_) -> size

let export_inode : inode -> string =
  fun inode ->
  match inode with
  | Inode (size,bis) ->
     match export_int (1+size) with (* +1 because 0 means unallocated *)
     | Pair (lo,hi) ->
        implode (lo :: hi :: map export_bi bis) (* might be short. that's ok *)

let blocks_for_size : int -> int =
  fun size ->
  if size = 0 then 0 else 1 + (size-1) / block_size (* avoiding -1/n !! (idiv issue) *)

let import_inode : string -> inode option  =
  fun s ->
  assert (string_length s = idata_size);
  let get = string_index in
  let n = import_int (Pair (get s 0, get s 1)) in
  if n = 0 then None else
    let size = n - 1 in
    let n_blocks = blocks_for_size size in
    let bis = take n_blocks (map import_bi (explode (substr 2 s 2 max_blocks_per_inode))) in
    Some (Inode (size, bis))

(* superblock *)

type super = Super of (int * int * int) (* #blocks; #inode-blocks; #inodes *)

let num_inodes super = match super with | Super(_,_,c) -> c

let make_super_10percent () =
  let a = num_blocks_on_disk in
  let b = (a / 10) + 1 in (* reserve 10% of blocks for inodes *)
  let c = inodes_per_block * b in
  Super (a,b,c)

let show_super s =
  match s with
  | Super(a,b,c) ->
     "[super: " ^ sofi a ^ "-" ^ sofi b ^ "-" ^ sofi c ^ "]"

let super_block_number = BI 0

let fs_signature = "BARE"

let export_super : super -> block =
  fun su ->
  match su with
  | Super (a,b,c) -> Block (fs_signature ^ implode [chr a;chr b;chr c])

let import_super : block -> super option =
  fun b ->
  let get = string_index in
  let s = deBlock b in
  let n = string_length fs_signature in
  if not (eq_string (substr 3 s 0 n) fs_signature) then None else
    Some (Super (ord (get s n), ord (get s (n+1)), ord (get s (n+2))))

(* called from format *)
let store_super : super -> unit =
  fun su -> store_block super_block_number (export_super su)

(* called from mount; fs-signature-string checked *)
let load_super : unit -> super option =
  fun () -> import_super (load_block super_block_number)


(* filesystem... *)

type fs = FS of super * ii list * bi list (* free inodes and blocks *)

let super_of_fs fs = match fs with | FS (super,_,_) -> super

let allocII : fs -> (fs,ii) pair option =
  fun fs ->
  match fs with
  | FS (super,iis,bis) ->
     match iis with
     | [] -> None
     | ii::iis -> Some (Pair (FS (super,iis,bis),ii))

let allocBI : fs -> (fs,bi) pair option =
  fun fs ->
  match fs with
  | FS (super,iis,bis) ->
     match bis with
     | [] -> None
     | bi::bis -> Some (Pair (FS (super,iis,bis),bi))

let freeII : fs -> ii -> fs =
  fun fs ii ->
  match fs with
  | FS (super,iis,bis) -> FS (super,ii::iis,bis)

let freeBI : fs -> bi -> fs =
  fun fs bi ->
  match fs with
  | FS (super,iis,bis) -> FS (super,iis,bi::bis)

let rec giveup_blocks : fs -> bi list -> fs = fun fs old ->
  match old with
  | [] -> fs
  | bi::bis -> giveup_blocks (freeBI fs bi) bis


let storeI : super -> ii -> inode option -> unit =
  fun super ii inode_opt ->
  assert (deII ii < num_inodes super);
  let s = deBlock (load_block (ii2bi ii)) in
  let data =
    match inode_opt with
    | None -> export_unallocated_inode
    | Some inode -> export_inode inode
  in
  let data = padR idata_size '*' data in (* not really nesc *)
  assert (string_length data = idata_size);
  let off = ii2off ii in
  let bytes = thaw_bytes s in
  let () = mod_substr bytes off data in
  let s = freeze_bytes bytes in
  store_block (ii2bi ii) (Block s)

let showI : inode option -> string = fun opt ->
  match opt with
  | None -> "unallocated"
  | Some inode -> show_inode inode

let loadI : super -> ii -> inode option =
  fun super ii ->
  assert (deII ii < num_inodes super);
  let s = deBlock (load_block (ii2bi ii)) in
  let off = ii2off ii in
  let len = idata_size in
  let s = substr 4 s off len in
  import_inode s

let debug_put_fs : fs -> unit =
  fun fs -> with_no_trace (fun () ->
  match fs with
  | FS (super,iis,bis) ->
     put_string "File system found:\n";
     put_string ("- super: " ^ show_super super ^ "\n");
     put_string ("- free blocks = " ^ concat "," (map show_bi bis) ^ "\n");
     put_string ("- free inodes = " ^ concat "," (map show_ii iis) ^ "\n");
     put_string "- inodes:\n";
     let super = super_of_fs fs in
     let n = num_inodes super in
     let pr i =
       let ii = II i in
       let opt = loadI super ii in
       if is_some opt then put_string ("- " ^ show_ii ii ^ " : " ^ showI opt ^ "\n") else ()
     in
     iter pr (upto 0 (n-1)))


(* fsck: discover the free block and free inode info *)
let fsck : unit -> fs option =
  fun () -> with_no_trace (fun () ->
  match load_super () with
  | None -> None
  | Some super ->
     match super with
     | Super (num_blocks,num_inode_blocks,num_inodes) ->
        let rec loop accB accI i =
          if i=num_inodes
          then Some (FS (super,rev accI,accB))
          else
            let ii = II i in
            match loadI super ii with
            | None -> loop accB (ii::accI) (i+1)
            | Some inode ->
               match inode with
               | Inode (_,bis) -> loop (list_diff eq_bi accB bis) accI (i+1)
        in
        let first_datablock = 1 + num_inode_blocks in
        let all_bis = map (fun b -> BI b) (upto first_datablock (num_blocks-1)) in
        loop all_bis [] 0)


let mounted : fs option ref = ref None

let error mes = put_string ("Error: " ^ mes ^ "\n")

(* format: wipe a disk of all data; creating an empty file-system in place *)
let sys_format : unit -> unit =
  fun () ->
  match !mounted with
  | Some _ -> error "cannot format a mounted filesystem"
  | None ->
     let super = make_super_10percent () in
     store_super super;
     let f i = storeI super (II i) None in
     let c = num_inodes super in
     iter f (upto 0 (c-1))

(* mount: discover the existing filesystem; None means no fs can be found *)
let sys_mount : unit -> unit =
  fun () ->
  match !mounted with
  | Some _ -> error "filesystem already mounted"
  | None ->
     match fsck () with
     | None -> error "no filesystem found"
     | Some fs ->
        mounted := Some fs


(* debug: discover the existing filesystem; and print info about it *)
let sys_debug : unit -> unit =
  fun () ->
  match !mounted with
  | None -> error "no filesystem mounted"
  | Some fs ->
     debug_put_fs fs

(* creat : create a new zero-size inode, returning None means no more inodes *)
let sys_creat : unit -> ii option =
  fun () ->
  match !mounted with
  | None -> (error "no filesystem mounted"; None)
  | Some fs ->
     match allocII fs with
     | None -> (error "no available inodes"; None)
     | Some p ->
        match p with
        | Pair(fs,ii) ->
           let inode = Inode (0,[]) in
           let super = super_of_fs fs in
           let () = storeI super ii (Some inode) in
           mounted := Some fs;
           Some ii

let _sys_remove : ii -> unit = (* TODO: reinstate/expose on command line *)
  fun ii ->
  match !mounted with
  | None -> error "no filesystem mounted"
  | Some fs ->
     let super = super_of_fs fs in
     match loadI super ii with
     | None -> error "inode is not allocated"
     | Some inode ->
        match inode with
        | Inode (_,bis) ->
           let fs = freeII fs ii in
           let fs = giveup_blocks fs bis in
           let () = storeI super ii None in
           mounted := Some fs;
           ()

let split_text : int -> string -> (string,string) pair =
  fun n text ->
  let len = string_length text in
  let a = if n < len then substr 5 text 0 n else text in
  let b = if n < len then substr 6 text n (len-n) else "" in
  Pair (a,b)

let chunk_text : int -> string -> string list =
  fun chunk_size full ->
  let rec loop acc s =
    if string_length s = 0 then rev acc else
      let p = split_text chunk_size s in
      match p with
      | Pair (a,b) -> loop (a::acc) b
  in
  loop [] full

let sys_write : ii -> int -> string -> unit = (* this is far too complicated! *)
  fun ii the_offset the_text ->
  match !mounted with
  | None -> put_string "no filesystem mounted\n"
  | Some fs ->
     let super = super_of_fs fs in
     match loadI super ii with
     | None -> put_string "inode is not allocated\n"
     | Some inode ->
        let size =
          let old_size = match inode with | Inode (n,_) -> n in
          let new_size = the_offset + string_length the_text in
          max old_size new_size
        in
        let rec loop fs acc bis offset chunks =
          match chunks with
          | [] ->
             let bis = rev acc @ bis in
             let () = storeI super ii (Some (Inode (size,bis))) in
             mounted := Some fs
          | chunk::chunks ->
            match bis with
            | bi::bis ->
               let () = update_block bi offset chunk in
               loop fs (bi::acc) bis 0 chunks
            | [] ->
               match allocBI fs with
               | None -> put_string "no available blocks\n"
               | Some p ->
                  match p with
                  | Pair(fs,bi) ->
                     let () = update_block bi offset chunk in
                     loop fs (bi::acc) [] 0 chunks
        in
        let the_chunks =
          let size1 = block_size - (the_offset % block_size) in
          match split_text size1 the_text with
          | Pair (a,b) -> a :: chunk_text block_size b
        in
        let rec skip_loop n fs acc bis =
          if n = 0
          then loop fs acc bis (the_offset % block_size) the_chunks
          else
            match bis with
            | bi::bis -> skip_loop (n-1) fs (bi::acc) bis
            | [] ->
               match allocBI fs with
               | None -> put_string "no available blocks\n"
               | Some p ->
                  match p with
                  | Pair(fs,bi) ->
                     let zero_data = fill_string block_size (chr 0) in
                     store_block bi (Block zero_data);
                     skip_loop (n-1) fs (bi::acc) []
        in
        let bis = match inode with | Inode (_,bis) -> bis in
        let nSkip = the_offset / block_size in
        let () = skip_loop nSkip fs [] bis in

        ()


let _sys_cat : ii -> string = (* TODO: expose on command line *)
  fun ii ->
  match !mounted with
  | None -> (put_string "no filesystem mounted\n"; "")
  | Some fs ->
     let super = super_of_fs fs in
     match loadI super ii with
     | None -> (put_string "inode is not allocated\n"; "")
     | Some inode ->
        match inode with
        | Inode (size,bis) ->
           (* TODO: do this in a more incremental way *)
           let str = concat "" (map (fun bi -> deBlock (load_block bi)) bis) in
           substr 7 str 0 size

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

let mk_com0 : string -> (unit -> unit) -> (string,command) pair =
  fun name f ->
  let err() = error ("usage: " ^ name ^ " [no args]") in
  Pair (name,
        Command (fun args ->
            match args with
            | _ :: _ -> err()
            | [] -> f()))

(*let mk_comI : string -> (int -> unit) -> (string,command) pair =
  fun name f ->
  let err() = error ("usage: " ^ name ^ " [int]") in
  Pair (name,
        Command (fun args ->
         | [] ->
         | arg1::args ->
            match parse_num arg1 with
            | None -> err()
            | Some i -> f i))*)

let com_create () =
  match sys_creat() with
  | None -> () (* no inodes; we already wrote an error *)
  | Some ii ->
     put_string ("Creating " ^ show_ii ii ^ "; (to finish type ^D)\n");
     let controlD = chr 4 in
     let rec loop offset =
       let text = read_line () in
       let n = string_length text in
       let stop = if n < 1 then false else eq_char (string_index text (n - 1)) controlD in
       let text = if stop then substr 9 text 0 (n-1) else text ^ "\n" in
       let () = sys_write ii offset text in
       (*let () = dump_everything () in*)
       if stop then () else loop (offset + string_length text)
     in
     loop 0

let put_ls : fs -> unit =
  fun fs -> with_no_trace (fun () ->
  match fs with
  | FS (_,_,_) ->
     let super = super_of_fs fs in
     let n = num_inodes super in
     let pr i =
       let ii = II i in
       match loadI super ii with
       | None -> ()
       | Some inode ->
          put_string (show_ii ii ^ " : " ^ sofi (size_of_inode inode) ^ "\n")
     in
     iter pr (upto 0 (n-1)))

let com_ls : unit -> unit =
  fun () ->
  match !mounted with
  | None -> error "no filesystem mounted"
  | Some fs ->
     put_ls fs

(* TODO: rm, cat, append, trunc *)
let the_command_map : cmap =
  Cmap
    [ mk_com0 "wipe" wipe_everything
    ; mk_com0 "dump" dump_everything
    ; mk_com0 "format" sys_format
    ; mk_com0 "mount" sys_mount
    ; mk_com0 "debug" sys_debug
    ; mk_com0 "ls" com_ls
    ; mk_com0 "create" com_create
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
  let line = read_line() in (* TODO: eixt on ^D *)
  execute line;
  repl (i+1)

let main () =
  let coms = keys the_command_map in
  put_string ("Commands: " ^ concat " " coms ^ "\n");
  sys_mount(); (* try mount to find any existing fs *)
  sys_format(); (* other wise make anew; wont be successful if the mount succeeded *)
  sys_mount(); (* try mount again *)
  (*dump_everything();*)
  com_ls();
  repl 1
