
(* Prelude stuff... *)

type 'a option = None | Some of 'a

type ('a,'b) pair = Pair of 'a * 'b

let not b =
  match b with
  | true -> false
  | false -> true

let (>) a b = b < a
let (<=) a b = not (b < a)
let (>=) a b = not (a < b)

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

(* primary string ops *)

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

let (^) = noinline (fun s1 s2 ->
  implode (explode s1 @ explode s2))

(* int ops *)

let min x y = if x < y then x else y
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

let put_string = (fun s -> put_chars (explode s))

let newline () = put_char '\n'

let put_string_nl s  = put_string s; newline ()

(* trace *)

let trace_on = ref false
let _trace = noinline (fun m -> if !trace_on then put_string ("trace: " ^ m ^ "\n") else ())
(*let traceF f = _trace (f ())*)
let traceF _f = ()

(* complex string ops *)

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
  let buf = make_bytes n in
  let rec loop i =
    if i >= n then () else
      (set_bytes buf i char; loop (i+1))
  in
  loop 0;
  freeze_bytes buf

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

let substr : string -> int -> int -> string =
  noinline (fun source offset len ->
  (*traceF (fun () ->"substr" ^ " source=[" ^ source ^ "], offset=" ^ sofi offset ^ " ,len=" ^ sofi len);*)
  let target = make_bytes len in
  assert (offset >= 0);
  assert (offset+len <= string_length source);
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
  assert (offset >= 0);
  assert (offset+slen <= string_length (freeze_bytes target));
  let rec loop i =
    if i >= slen then () else
      let char = string_index source i in
      let () = set_bytes target (offset+i) char in
      loop (i+1)
  in
  loop 0)

let split_text : int -> string -> (string,string) pair =
  fun n text ->
  let len = string_length text in
  let a = if n < len then substr text 0 n else text in
  let b = if n < len then substr text n (len-n) else "" in
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

(* read_line *)

let erase_char () =
  let backspace = chr 8 in
  (* erase the previously echoed char on the terminal *)
  put_char backspace;
  put_char ' ';
  put_char backspace

let controlD = chr 4
let single_controlD = implode [controlD]

let read_line = noinline (fun () ->
  let rec readloop acc = (* TODO: have max length to avoid chance of OOOM *)
    let c = get_char () in
    let n = ord c in
    if eq_char c '\n' then (newline(); rev_implode acc) else
      if eq_char c controlD then (put_char controlD; newline(); rev_implode (controlD :: acc)) else
        if n > 127 then readloop acc else
          if n = 127 then
            match acc with
            | [] -> readloop acc
            | c::tail ->
               let n = ord c in
               let () =
                 if n <= 26 then (erase_char(); erase_char()) else (* The ^ printed for control chars *)
                   if n < 32 then (erase_char(); erase_char(); erase_char()) else
                     if n > 126 then (erase_char(); erase_char(); erase_char()) else
                       erase_char()
               in
               readloop tail
          else
            (put_char c; readloop (c :: acc))
  in
  readloop [])

(* Filesystem code starts here... *)

(* disk sectors *)

let sector_size = 512
let num_sectors_on_disk = 10 (* 31 is max here; if 32 we get 8*32=256 blocks, which is too big for a #blocks char in super block info *)
let block_size = 128 (* blocks; the smallest unit of access for file-data *)

let blocks_per_sector = sector_size / block_size
let num_blocks_on_disk = blocks_per_sector * num_sectors_on_disk

let read_sector : int -> string =
  fun seci ->
  let buf = make_bytes sector_size in
  let () = load_sector seci buf in
  freeze_bytes buf

let put_sector : string -> unit = fun s ->
  let rec loop i =
    if i >= sector_size then () else
      let c = string_index s i in
      if eq_char c '\n' then put_string "\\n" else put_char c;
      if (i+1) % block_size = 0 then newline() else ();
      loop (i+1)
  in
  loop 0

let update_sector : int -> int -> string -> unit =
  fun seci offset text ->
  let buf = make_bytes sector_size in
  let () = load_sector seci buf in
  let () = mod_substr buf offset text in
  store_sector seci (freeze_bytes buf)

let read_sector_show : int -> unit =
  fun seci ->
  put_sector (read_sector seci)

(* TODO: last sector caching! -- have old code for this *)

type block = Block of string
let deBlock x = match x with Block y -> y

(* block index *)

type bi = BI of int
let deBI x = match x with BI y -> y
let export_bi : bi -> char = fun bi -> chr (deBI bi)
let import_bi : char -> bi = fun c -> BI (ord c)
let show_bi : bi -> string = fun bi -> "B" ^ sofi (deBI bi)
let eq_bi : bi -> bi -> bool = fun x y -> deBI x = deBI y

let show_seci = noinline (fun seci -> "[" ^ sofi seci ^ "]")

let store_block : bi -> block -> unit = noinline (fun bi block ->
  let i = deBI bi in
  assert (i >= 0);
  assert (i < num_blocks_on_disk);
  let seci = i / blocks_per_sector in
  let () = traceF (fun () -> "store_block " ^ sofi i ^ show_seci seci) in
  let offset = block_size * (i % blocks_per_sector) in
  update_sector seci offset (deBlock block))

let load_block : bi -> block = noinline (fun bi ->
  let i = deBI bi in
  assert (i >= 0);
  assert (i < num_blocks_on_disk);
  let seci = i / blocks_per_sector in
  let () = traceF (fun () -> "load_block " ^ sofi i ^ show_seci seci) in
  let sector = read_sector (i / blocks_per_sector) in
  let offset = block_size * (i % blocks_per_sector) in
  Block (substr sector offset block_size))

let update_block : bi -> int -> string -> unit =
  noinline (fun bi offset text ->
  let () = traceF (fun () -> "update_block, bi=" ^ show_bi bi ^ ", offset=" ^ sofi offset ^ " text=[" ^ text ^ "]") in
  let block = load_block bi in
  let buf = thaw_bytes (deBlock block) in
  let () = mod_substr buf offset text in
  store_block bi (Block (freeze_bytes buf)))

(* inode *)

let idata_size = 8
let bytes_for_size = 2

let max_blocks_per_file = idata_size - bytes_for_size
let max_file_size = max_blocks_per_file * block_size

let inodes_per_admin_block = block_size / idata_size

type inode = Inode of (int * bi list) (* file-size and block-list(#max=6); exports as 8 bytes on disk *)

let export_int : int -> (char,char) pair = (* little endian *)
  fun n ->
  assert (n <= max_file_size);
  let i = n / 256 in
  let j = n % 256 in
  Pair (chr j, chr i)

let import_int : (char,char) pair -> int option =
  fun p ->
  match p with
  | Pair(lo,hi) ->
     let i = ord hi in
     let j = ord lo in
     if (i > max_file_size/256) then None else (* corrupt *)
       let n = 256*i + j in
       Some n

let export_unallocated_inode : string =
  match export_int 0 with
  | Pair (lo,hi) ->
     implode [lo;hi]

let show_inode : inode -> string =
  fun inode ->
  match inode with
  | Inode (size,bis) ->
     "Inode: size=" ^ sofi size ^ ", blocks=[" ^ concat "," (map show_bi bis) ^ "]"

let showI : inode option -> string = fun opt ->
  match opt with
  | None -> "unallocated"
  | Some inode -> show_inode inode

let size_of_inode : inode -> int = fun inode ->
  match inode with
  | Inode (size,_) -> size

let export_inode : inode -> string =
  fun inode ->
  match inode with
  | Inode (size,bis) ->
     match export_int (1+size) with (* +1 because 0 means unallocated *)
     | Pair (lo,hi) ->
        implode (lo :: hi :: map export_bi bis) (* may be short of the 8 bytes; that's ok *)

let blocks_for_size : int -> int =
  fun size ->
  if size = 0 then 0 else 1 + (size-1) / block_size (* avoiding -1/n !! (idiv issue) *)

let import_inode : string -> inode option  =
  fun s ->
  assert (string_length s = idata_size);
  let get = string_index in
  match import_int (Pair (get s 0, get s 1)) with
  | None -> None (* corrupt; treat as unallocated; probably better to unmount *)
  | Some n ->
     if n = 0 then None else
       let size = n - 1 in
       let n_blocks = blocks_for_size size in
       let bis = take n_blocks (map import_bi (explode (substr s 2 max_blocks_per_file))) in
       Some (Inode (size, bis))

(* superblock *)

type super = Super of (int * int * int) (* #blocks; #inode-blocks; #inodes *)

let num_inodes super = match super with Super(_,_,c) -> c

let make_super_10percent () =
  let a = num_blocks_on_disk in
  let b = (a / 10) + 1 in (* reserve 10% of blocks for inodes *)
  let c = inodes_per_admin_block * b in
  Super (a,b,c)

let show_super s =
  match s with
  | Super(a,b,c) ->
     "#blocks=" ^ sofi a ^ ", #admin-blocks=1+" ^ sofi b ^ ", #inodes=" ^ sofi c

let super_block_number = BI 0

let fs_signature = "BARE"

let export_super : super -> block =
  fun super ->
  match super with
  | Super (a,b,c) -> Block (fs_signature ^ implode [chr a;chr b;chr c])

let import_super : block -> super option =
  fun b ->
  let get = string_index in
  let s = deBlock b in
  let n = string_length fs_signature in
  if not (eq_string (substr s 0 n) fs_signature) then None else
    Some (Super (ord (get s n), ord (get s (n+1)), ord (get s (n+2))))

(* called from format *)
let store_super super = store_block super_block_number (export_super super)

(* called from fsck; fs-signature-string checked *)
let load_super () = import_super (load_block super_block_number)

(* errors *)

let error mes = put_string ("Error: " ^ mes ^ "\n")

let mes_no_filesystem_mounted = "no filesystem mounted; try mount"
let mes_inode_index_not_allocated = "inode is not allocated (no such file)"
let mes_no_blocks_available = "no blocks available (disk is full)"
let mes_no_inodes_available = "no inodes available (too many files)"

(* inode index *)

type ii = II of int
let deII x = match x with II y -> y
let show_ii : ii -> string = fun ii -> "I" ^ sofi (deII ii)

let ii2bi : ii -> bi = fun ii -> BI (deII ii / inodes_per_admin_block + 1)
let ii2off : ii -> int = fun ii -> (deII ii % inodes_per_admin_block) * idata_size

(* fs: filesystem: superblock info + free lists *)

type fs = FS of super * ii list * bi list (* free inodes and blocks *)

let super_of_fs fs = match fs with FS (super,_,_) -> super

let loadI : super -> ii -> inode option =
  noinline (fun super ii ->
  if deII ii >= num_inodes super
  then (error "no such inode"; None)
  else
    let s = deBlock (load_block (ii2bi ii)) in
    let off = ii2off ii in
    let len = idata_size in
    let s = substr s off len in
    import_inode s)

(* fsck: discover/compute the free block and free inode info *)
let fsck : unit -> fs option =
  noinline (fun () ->
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
  noinline (fun super ii inode_opt ->
  assert (deII ii < num_inodes super);
  let s = deBlock (load_block (ii2bi ii)) in
  let data =
    match inode_opt with
    | None -> export_unallocated_inode
    | Some inode -> export_inode inode
  in
  let off = ii2off ii in
  let bytes = thaw_bytes s in
  let () = mod_substr bytes off data in
  let s = freeze_bytes bytes in
  store_block (ii2bi ii) (Block s))

let mounted : fs option ref = ref None

let sys_creat : unit -> ii option =
  fun () ->
  match !mounted with
  | None -> (error mes_no_filesystem_mounted; None)
  | Some fs ->
     match allocII fs with
     | None -> (error mes_no_inodes_available; None)
     | Some p ->
        match p with
        | Pair(fs,ii) ->
           let inode = Inode (0,[]) in
           let super = super_of_fs fs in
           let () = storeI super ii (Some inode) in
           mounted := Some fs;
           Some ii

let sys_get_inode : ii -> inode option =
  fun ii ->
  match !mounted with
  | None -> (error mes_no_filesystem_mounted; None)
  | Some fs ->
     let super = super_of_fs fs in
     match loadI super ii with
     | None -> (error mes_inode_index_not_allocated; None)
     | Some inode ->
        Some inode

let sys_read : ii -> int -> int -> bytes -> int =
  fun ii offset len_wanted buffer ->
  match !mounted with
  | None -> (error mes_no_filesystem_mounted; 0)
  | Some fs ->
     let super = super_of_fs fs in
     match loadI super ii with
     | None -> (error mes_inode_index_not_allocated; 0)
     | Some inode ->
        let rec loop bis file_remaining offset =
          assert (offset>=0);
          if file_remaining <= 0 then 0 else
            match bis with
            | [] -> 0
            | bi::bis ->
               if offset >= block_size
               then loop bis file_remaining (offset - block_size)
               else
                 let block_remining = block_size - offset in
                 let len = min len_wanted (min block_remining file_remaining) in
                 assert (len>=1);
                 let str = deBlock (load_block bi) in
                 let data = substr str offset len in
                 let () = mod_substr buffer 0 data in
                 len
        in
        if len_wanted = 0 then 0 else
          let bis = match inode with Inode (_,bis) -> bis in
          let size = match inode with Inode (n,_) -> n in
          loop bis (size - offset) offset

let sys_write : ii -> int -> string -> unit = (* too complicated! *)
  fun ii the_offset the_text ->
  match !mounted with
  | None -> error mes_no_filesystem_mounted
  | Some fs ->
     let super = super_of_fs fs in
     match loadI super ii with
     | None -> error mes_inode_index_not_allocated
     | Some inode ->
        let size =
          let old_size = match inode with Inode (n,_) -> n in
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
               | None -> error mes_no_blocks_available
               | Some p ->
                  match p with
                  | Pair(fs,bi) ->
                     let () = update_block bi offset chunk in
                     loop fs (bi::acc) [] 0 chunks
        in
        let the_chunks =
          let size1 = block_size - (the_offset % block_size) in
          if string_length the_text = 0 then [] else
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
               | None -> error mes_no_blocks_available
               | Some p ->
                  match p with
                  | Pair(fs,bi) ->
                     let zero_data = fill_string block_size (chr 0) in
                     store_block bi (Block zero_data);
                     skip_loop (n-1) fs (bi::acc) []
        in
        let bis = match inode with Inode (_,bis) -> bis in
        let nSkip = the_offset / block_size in
        (* TODO: if the_offset exceeds prev size, we must zero fill the gap *)
        skip_loop nSkip fs [] bis

(* Command infrastructure *)

type command = Command of (string list -> unit)

type cmap = Cmap of (string,command) pair list
let deCmap thing = match thing with Cmap x -> x

let cmap_keys : cmap -> string list =
  let rec loop acc ps =
    match ps with
    | [] -> rev acc
    | e1::ps ->
       match e1 with
       | Pair (name,_) -> loop (name::acc) ps
  in
  fun cmap -> loop [] (deCmap cmap)

let cmap_lookup : string -> cmap -> command option = fun sought ->
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
  noinline (fun name f ->
  let err() = error ("usage: " ^ name ^ " [no args]") in
  Pair (name,
        Command (fun args ->
            match args with
            | _ :: _ -> err()
            | [] -> f())))

let mk_comI : string -> (int -> unit) -> (string,command) pair =
  noinline (fun name f ->
  let err() = error ("usage: " ^ name ^ " [int]") in
  Pair (name,
        Command (fun args ->
            match args with
            | [] -> err()
            | arg1 :: args ->
               match args with
               | _ :: _ -> err()
               | [] ->
                  match parse_num arg1 with
                  | None -> err()
                  | Some i -> f i)))

let mk_comII : string -> (int -> int -> unit) -> (string,command) pair =
  noinline (fun name f ->
  let err() = error ("usage: " ^ name ^ " [int] [int]") in
  Pair (name,
        Command (fun args ->
            match args with
            | [] -> err()
            | arg1 :: args ->
               match args with
               | [] -> err()
               | arg2 :: args ->
                  match args with
                  | _ :: _ -> err()
                  | [] ->
                     match parse_num arg1 with
                     | None -> err()
                     | Some i ->
                        match parse_num arg2 with
                        | None -> err()
                        | Some j -> f i j)))

(* specific commands... *)

(* wipe: Wipe a disk; fill it with commas! *)
let command_wipe_disk () =
  let commas = fill_string sector_size ',' in
  let rec loop i =
    if i >= num_sectors_on_disk then () else
      let () = store_sector i commas
      in loop (i+1)
  in
  loop 0

(* dump: Display the raw data on the disk. *)
let command_dump_disk () =
  let rec loop i =
    if i >= num_sectors_on_disk then () else
      let () = read_sector_show i
      in loop (i+1)
  in
  loop 0

(* format: Prepare a disk with an empty file-system; trashing whatever is currently there. *)
let command_format () =
  match !mounted with
  | Some _ -> error "cannot format a mounted filesystem; try unmount"
  | None ->
     let super = make_super_10percent () in
     store_super super;
     let f i = storeI super (II i) None in
     let c = num_inodes super in
     iter f (upto 0 (c-1))

(* mount: Discover the existing filesystem; allow files to be accessed. *)
let command_mount = noinline (fun () ->
  match !mounted with
  | Some _ -> error "filesystem already mounted"
  | None ->
     match fsck () with
     | None -> error "no filesystem found; try format"
     | Some fs ->
        mounted := Some fs)

(* unmount: Unmount the existing filesystem; required to format. *)
let command_unmount () =
  match !mounted with
  | None -> error mes_no_filesystem_mounted
  | Some _ -> mounted := None

(* debug: Display internal information about the filesystem. *)
let command_debug () =
  match !mounted with
  | None -> error mes_no_filesystem_mounted
  | Some fs ->
     match fs with
     | FS (super,iis,bis) ->
        put_string "Filesystem found:\n";
        put_string ("- superblock: " ^ show_super super ^ "\n");
        put_string ("- #free-blocks = " ^ sofi (length bis) ^ "\n");
        put_string ("- #free-inodes = " ^ sofi (length iis) ^ "\n")

(* stat: Display internal information about an inode. *)
let command_stat i =
  match !mounted with
  | None -> error mes_no_filesystem_mounted
  | Some fs ->
     let super = super_of_fs fs in
     let ii = II i in
     let opt = loadI super ii in
     put_string (show_ii ii ^ " : " ^ showI opt ^ "\n")

(* list: List all file/sizes of a mounted filesystem. *)
let command_list = noinline (fun () ->
  match !mounted with
  | None -> error mes_no_filesystem_mounted
  | Some fs ->
     match fs with
     | FS (_,_,_) ->
        let super = super_of_fs fs in
        let n = num_inodes super in
        let pr i =
          let ii = II i in
          match loadI super ii with
          | None -> ()
          | Some inode ->
             put_string ("file " ^ sofi (deII ii) ^ " : " ^ sofi (size_of_inode inode) ^ "\n")
        in
        iter pr (upto 0 (n-1)))

let rec write_to_file ii offset =
  let text = read_line () in
  let n = string_length text in
  let stop = n > 0 && eq_char (string_index text (n - 1)) controlD in
  let text = if stop then substr text 0 (n-1) else text ^ "\n" in
  let () = sys_write ii offset text in
  if stop then () else write_to_file ii (offset + string_length text)

(* create: Create a new file in a mounted filesystem. *)
let command_create () =
  match sys_creat() with
  | None -> () (* no inodes; we already wrote an error *)
  | Some ii ->
     put_string ("Creating file " ^ sofi (deII ii) ^ "; (to finish type ^D)\n");
     write_to_file ii 0

(* append: Append to an existing file (selected by indexed) in a mounted filesystem. *)
let command_append i =
  let ii = II i in
  put_string ("Appending to file " ^ sofi (deII ii) ^ "; (to finish type ^D)\n");
  match sys_get_inode ii with
  | None -> ()
  | Some inode -> write_to_file ii (size_of_inode inode)

(* overwrite: Overwrite an existing file at a given offset (selected by indexed) in a mounted filesystem. *)
let command_overwrite i offset =
  let ii = II i in
  put_string ("Overwriting file " ^ sofi (deII ii) ^ " from offset " ^ sofi offset ^ "; (to finish type ^D)\n");
  write_to_file ii offset

(* remove: Remove a file (selected by index) from a mounted filesystem; returning resources for reuse. *)
let command_remove i =
  let ii = II i in
  match !mounted with
  | None -> error mes_no_filesystem_mounted
  | Some fs ->
     let super = super_of_fs fs in
     match loadI super ii with
     | None -> error mes_inode_index_not_allocated
     | Some inode ->
        match inode with
        | Inode (_,bis) ->
           let fs = freeII fs ii in
           let fs = giveup_blocks fs bis in
           let () = storeI super ii None in
           mounted := Some fs;
           ()

(* cat : Display the contents of a file (selected by index) from a mounted filesystem. *)
let command_cat i =
  let ii = II i in
  let buf_size = block_size in (* can be any size >=1, but block_size is best *)
  let buf = make_bytes buf_size in
  let rec loop offset =
    let n_read = sys_read ii offset buf_size buf in
    if n_read = 0 then () else
      let str = freeze_bytes buf in
      if n_read = buf_size
      then put_string str
      else put_string (substr str 0 n_read);
      loop (offset + n_read)
  in
  loop 0

let help_lines =
[ "dump      : Display the raw data on disk."
; "sector I  : Display the raw data in disk sector I."
; "format    : Prepare disk with an empty filesystem; trashing existing contents."
; "mount     : Discover an existing filesystem; allow files to be accessed."
; "unmount   : Unmount the existing filesystem; required before format."
; "debug     : Display internal information about a mounted filesystem."
; "ls        : List all files together with their sizes."
; "stat I    : Display internal information about inode(file) I."
; "cat I     : Display the contents of file I."
; "rm I      : Remove file F; returning resources for reuse."
; "create    : Create new file; lines read from input."
; "append I  : Append to existing file I; lines read from input."
; "splat I N : Overwrite existing file I from offset N; lines read from input."
; "wipe      : Wipe disk; fill it with commas."
]

let command_help () =
  iter put_string_nl help_lines

let the_command_map : cmap =
  Cmap
    [ mk_com0 "help" command_help
    ; mk_com0 "dump" command_dump_disk
    ; mk_comI "sector" read_sector_show
    ; mk_com0 "format" command_format
    ; mk_com0 "mount" command_mount
    ; mk_com0 "unmount" command_unmount
    ; mk_com0 "debug" command_debug
    ; mk_com0 "ls" command_list
    ; mk_comI "stat" command_stat
    ; mk_comI "cat" command_cat
    ; mk_comI "rm" command_remove
    ; mk_com0 "create" command_create
    ; mk_comI "append" command_append
    ; mk_comII "splat" command_overwrite
    ; mk_com0 "wipe" command_wipe_disk
    (* TODO: trunc *)
    ]

let execute : string -> unit = fun line ->
  match split_words line with
  | [] -> ()
  | arg0::args ->
     match cmap_lookup arg0 the_command_map with
     | None -> error (arg0 ^ " : command not found")
     | Some command ->
        match command with
        | Command f -> f args

let prompt i = put_string (sofi i ^ "> ")

let quit () = (* sync here when caching is introduced *)
  put_string "exiting\n"

let rec repl i =
  prompt i;
  let line = read_line() in
  if eq_string line single_controlD then quit () else
    let () = execute line in
    repl (i+1)

let auto_mount() = (* useful during development *)
  command_mount();
  command_list()

let print_size_info() =
  put_string_nl ("- sector_size: " ^ sofi sector_size);
  put_string_nl ("- #sectors_on_disk: " ^ sofi num_sectors_on_disk);
  put_string_nl ("- addressable disk: " ^ sofi (num_sectors_on_disk * sector_size));
  put_string_nl ("- block_size: " ^ sofi block_size);
  put_string_nl ("- #blocks_on_disk: " ^ sofi num_blocks_on_disk);
  put_string_nl ("- max_file_size (6 blocks): " ^ sofi max_file_size);
  ()

let main () =
  let coms = cmap_keys the_command_map in
  put_string_nl "Filesystem explorer";
  print_size_info();
  put_string ("Try: " ^ concat " " coms ^ "\n");
  auto_mount();
  repl 1
