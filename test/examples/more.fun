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

let implode = noinline (fun xs ->
  let b = make_bytes (length xs) in
  let rec loop i xs =
    match xs with
    | [] -> ()
    | x::xs -> set_bytes b i x; loop (i+1) xs
  in
  loop 0 xs;
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


let fill_string : int -> char -> string = fun n char ->
  let buf = make_bytes n in
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

let trace_on = ref false

let trace = noinline (fun m -> if !trace_on then put_string ("trace: " ^ m ^ "\n") else ())

let with_no_trace f =
  let old = !trace_on in
  trace_on := false;
  let res = f () in
  trace_on := old;
  res

(* inode/fs...*)

let sector_size = 512
let num_sectors = 3 (*32*) (* keep this small for dev; easy to see fully dump *)

let block_size = 64
let blocks_per_sector = 8
let () = assert (block_size * blocks_per_sector = sector_size)

let num_blocks = blocks_per_sector * num_sectors

(*let string_index s n = (* checked version *)
  assert (n >= 0);
  assert (n < string_length s);
  string_index s n*)

let substr : string -> int -> int -> string =
  noinline (fun source offset len ->
  let target = make_bytes len in
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
  (*let () = trace ("mod_substr: #target=" ^ sofi tlen ^ ", offset=" ^ sofi offset ^ ", #source=" ^ sofi slen) in*)
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
  assert (seci < num_sectors);
  (*let () = trace ("(SLOW) load_sector " ^ sofi seci) in*)
  load_sector seci buf

let read_sector : int -> string =
  fun seci ->
  let buf = make_bytes sector_size in
  let () = load_sector seci buf in
  freeze_bytes buf

let put_sector : string -> unit = fun s ->
  let rec loop i =
    if i >= 512 then () else
      let c = string_index s i in
      (put_char c;
       (if i % 64 = 63 then newline() else ());
       loop (i+1))
  in
  loop 0

let update_sector : int -> int -> string -> unit =
  fun seci offset text ->
  let buf = make_bytes sector_size in
  let () = load_sector seci buf in
  let () = mod_substr buf offset text in
  let () = store_sector seci (freeze_bytes buf) in
  ()

let read_sector_show : int -> unit =
  fun seci ->
  put_sector (read_sector seci)

let _wipe_everything () =
  let commas = fill_string sector_size ',' in
  let rec loop i =
    if i >= num_sectors then () else
      let () = store_sector i commas
      in loop (i+1)
  in
  loop 0

let _dump_everything () = with_no_trace (fun () ->
  let rec loop i =
    if i >= num_sectors then () else
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
  assert (i < num_blocks);
  let seci = i / blocks_per_sector in
  let () = trace ("store_block " ^ sofi i ^ show_seci seci) in
  let offset = block_size * (i % blocks_per_sector) in
  update_sector seci offset (deBlock block)


let load_block : bi -> block = fun bi ->
  let i = deBI bi in
  assert (i >= 0);
  assert (i < num_blocks);
  let seci = i / blocks_per_sector in
  let () = trace ("load_block " ^ sofi i ^ show_seci seci) in
  let sector = read_sector (i / blocks_per_sector) in
  let offset = block_size * (i % blocks_per_sector) in
  Block (substr sector offset block_size)


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
     assert (i <= max_file_size/256);
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
    let bis = take n_blocks (map import_bi (explode (substr s 2 max_blocks_per_inode))) in
    Some (Inode (size, bis))

(* superblock *)

type super = Super of (int * int * int) (* #blocks; #inode-blocks; #inodes = #inode-blocks * 8 *)

let max_inodes : super -> int =
  fun super -> match super with | Super(_,_,n) -> n

let make_super a b c =
  assert (a>0);
  assert (b>0);
  assert (c>0);
  assert (a<255);
  assert (b<255);
  assert (c<255);
  assert ((1 + (c-1) / inodes_per_block) = b);
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
  if not (eq_string (substr s 0 n) fs_signature) then None else
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
  assert (deII ii < max_inodes super);
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
  assert (deII ii < max_inodes super);
  let s = deBlock (load_block (ii2bi ii)) in
  let off = ii2off ii in
  let len = idata_size in
  let s = substr s off len in
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
     let n = max_inodes super in
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


(* format: wipe a disk of all data; creating an empty file-system in place *)
let _format : unit -> unit =
  fun () ->
  match !mounted with
  | Some _ -> put_string "** cannot format a mounted filesystem\n"
  | None ->
     let a = num_blocks in
     let b = (a / 10) + 1 in
     let c = (a - b) in
     let super = make_super a b c in
     trace ("format: " ^ show_super super);
     store_super super;
     let f i = storeI super (II i) None in
     iter f (upto 0 (c-1))

(* mount: discover the existing filesystem; None means no fs can be found *)
let _mount : unit -> unit =
  fun () ->
  match !mounted with
  | Some _ -> put_string "** filesystem already mounted\n"
  | None ->
     match fsck () with
     | None -> put_string "** no filesystem found\n"
     | Some fs ->
        mounted := Some fs


(* debug: discover the existing filesystem; and print info about it *)
let _debug : unit -> unit =
  fun () ->
  match !mounted with
  | None -> put_string "** no filesystem mounted\n"
  | Some fs ->
     debug_put_fs fs


(* creat : create a new zero-size inode, returning None means no more inodes *)
let _creat : unit -> ii option =
  fun () ->
  match !mounted with
  | None -> (put_string "** no filesystem mounted\n"; None)
  | Some fs ->
     match allocII fs with
     | None -> (put_string "** no available inodes\n"; None)
     | Some p ->
        match p with
        | Pair(fs,ii) ->
           let inode = Inode (0,[]) in
           let super = super_of_fs fs in
           let () = storeI super ii (Some inode) in
           mounted := Some fs;
           Some ii

let _remove : ii -> unit =
  fun ii ->
  match !mounted with
  | None -> put_string "** no filesystem mounted\n"
  | Some fs ->
     let super = super_of_fs fs in
     match loadI super ii with
     | None -> put_string "** inode is not allocated\n"
     | Some inode ->
        match inode with
        | Inode (_,bis) ->
           let fs = freeII fs ii in
           let fs = giveup_blocks fs bis in
           let () = storeI super ii None in
           mounted := Some fs;
           ()

(* trunc: expand/truncate an inode to a given size; allocating/freeing blocks as required.
   Returning None means no more blocks available. *)
let _trunc : ii -> int -> unit =
  fun ii size ->
  if (size > max_file_size) then put_string "** size too bug for trunc" else
    match !mounted with
    | None -> put_string "** no filesystem mounted\n"
    | Some fs ->
       let super = super_of_fs fs in
       match loadI super ii with
       | None -> put_string "** inode is not allocated\n"
       | Some inode ->
          let rec loop fs acc bis n =
            if n = 0
            then
              let super = super_of_fs fs in
              let () = storeI super ii (Some (Inode (size,rev acc))) in
              let fs = giveup_blocks fs bis in
              mounted := Some fs
            else
              match bis with
              | bi::bis -> loop fs (bi::acc) bis (n-1)
              | [] ->
                 match allocBI fs with
                 | None -> put_string "** no available blocks\n"
                 | Some p ->
                    match p with
                    | Pair(fs,bi) ->
                       (* TODO: dont need to zero fill the enitre block *)
                       let zero_data = fill_string block_size (chr 0) in
                       store_block bi (Block zero_data);
                       loop fs (bi::acc) [] (n-1)
          in
          match inode with
          | Inode (_,bis) ->
             let goal_num_blocks = blocks_for_size size in
             loop fs [] bis goal_num_blocks


(* TODO : read & wrte -- need to take offset and len *)

let _cat : ii -> string =
  fun ii ->
  match !mounted with
  | None -> (put_string "** no filesystem mounted\n"; "")
  | Some fs ->
     let super = super_of_fs fs in
     match loadI super ii with
     | None -> (put_string "** inode is not allocated\n"; "")
     | Some inode ->
        match inode with
        | Inode (size,bis) ->
           (* TODO: do this in a more incremental way *)
           let str = concat "" (map (fun bi -> deBlock (load_block bi)) bis) in
           substr str 0 size

let _write : ii -> string -> unit =
  fun ii text ->
  _trunc ii (string_length text);
  match !mounted with
  | None -> put_string "** no filesystem mounted\n"
  | Some fs ->
     let super = super_of_fs fs in
     match loadI super ii with
     | None -> put_string "** inode is not allocated\n"
     | Some inode ->
        match inode with
        | Inode (_size,bis) ->
           (* TODO: This dummy_data is a hack to make substr work *)
           let dummy_data = fill_string block_size (chr 1) in
           let text = text ^ dummy_data in
           let rec loop offset bis =
             match bis with
             | [] -> ()
             | bi::bis ->
                let sub = substr text offset block_size in
                let () = store_block bi (Block sub) in
                loop (offset + block_size) bis
           in
           loop 0 bis

let _append : ii -> string -> unit =
  fun _ _ ->
  (* TODO get existing size & wrte at that offset *)
  crash "append"

(* TODO: drive from simple command line *)

let main () =
  let _get_some o = match o with | None -> crash "get_some" | Some x -> x in
  let () = _wipe_everything() in
  let () = _format() in
  let () = _mount() in
  let a = _get_some (_creat()) in
  let () = _trunc a 1 in
  let () = _write a (fill_string 88 'x') in
  let () = _trunc a 62 in
  let () = _dump_everything() in
  let () = _debug() in
  put_string ("a=[" ^ _cat a ^ "]\n");
  ()
