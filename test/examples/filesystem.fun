
(* Lets code up my own filesystem... TODO: inodes etc... *)

let trace0_on = true
let trace_on = false

(* grabbed from sham.fun *)

let (@@) f x = f x

let not b =
  match b with
  | true -> false
  | false -> true

let (>) a b = b < a
let (>=) a b = not (a < b)  (* not in sham *)

let noinline = let rec block f a = let _ = block in f a in block

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

let implode = noinline @@ (fun xs ->
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

let (^) s1 s2 =
  implode (explode s1 @ explode s2)

(* io *)

(* A prettier put_char for control chars; also aligned with backspacing *)
let put_char c =
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


(* grabbed from shell.fun *)

let chars_of_int i = (* TODO: make this work for negative numbers *)
  let ord0 = ord '0' in
  let char_of_digit c = chr (ord0 + c) in
  let rec loop acc i =
    if i = 0 then acc else
      loop (char_of_digit (i%10) :: acc) (i/10)
  in
  if i = 0 then ['0'] else loop [] i


(* new misc here... *)

let put_string_newline s = put_string s; newline ()

let sofi i = implode (chars_of_int i)

let replicate : 'a -> int -> 'a list = fun x ->
  let rec loop acc i =
    if i = 0 then acc else loop (x::acc) (i-1)
  in
  loop []

(*let rec crash () = crash ()*)
let error m = put_string ("error: " ^ m ^ "\n"); crash()

let trace0 m = if trace0_on then put_string ("trace: " ^ m ^ "\n") else ()
let trace m = if trace_on then put_string ("trace: " ^ m ^ "\n") else ()

let my_assert : bool -> unit = fun b -> if b then () else error "assert failed"


let get_slice_bytes : bytes -> int -> int -> bytes = (* pread? *)
  fun source offset len ->
  let target = make_bytes len in
  let rec loop i =
    if i >= len then () else
      let char = get_bytes source (offset+i) in (* WAS bug!! FFS "1" instead of "i" *)
      set_bytes target i char;
      loop (i+1)
  in
  loop 0;
  target

let set_slice_bytes : bytes -> int -> int -> bytes -> unit = (* pwrite? *)
  fun target offset len source ->
  let rec loop i =
    if i >= len then () else
      let char = get_bytes source i in
      let () = set_bytes target (offset+i) char in
      loop (i+1)
  in
  loop 0


(* emulate full disk in memory, with read_sector/write_sector *)

type disk = Disk of bytes
let deDisk thing = match thing with | Disk x -> x

let num_sectors = 32
let sector_size = 512

let disk_size = num_sectors * sector_size

let make_disk : unit -> disk =
  fun () ->
  Disk (make_bytes disk_size)

type sector = Sector of bytes
let deSector thing = match thing with | Sector x -> x

let bad_sector_index i = if i < 0 then true else i >= num_sectors

let read_sector : disk -> int -> sector =
  fun disk seci ->
  if bad_sector_index seci then error ("read_sector " ^ sofi seci) else
    let () = trace0 ("read_sector " ^ sofi seci ^ "   **SLOW**") in
    Sector (get_slice_bytes (deDisk disk) (seci*sector_size) sector_size)

let write_sector : disk -> int -> sector -> unit =
  fun disk seci sector ->
  if bad_sector_index seci then error ("write_sector " ^ sofi seci) else
    let () = trace0 ("write_sector " ^ sofi seci ^ "   **SLOW**") in
    set_slice_bytes (deDisk disk) (seci*sector_size) sector_size (deSector sector)


(* Last sector caching... *)

type cache_line = Cache_Line of bool ref * int * sector
type diskC1 = DiskC1 of disk * cache_line ref

let make_diskC1 : unit -> diskC1 =
  fun () ->
  let disk = make_disk () in
  let seci = 0 in
  let sector = read_sector disk seci in
  let cache_line = Cache_Line (ref false,seci,sector) in
  DiskC1 (disk,ref cache_line)

let read_sectorC1 : diskC1 -> int -> sector =
  fun dc seci ->
  trace ("read_sectorC1 seci=" ^ sofi seci);
  match dc with
  | DiskC1 (disk,r) ->
     let cache_line = deref r in
     match cache_line with
     | Cache_Line (dirty,secj,sector) ->
        if seci = secj then sector
        else
          let () = if deref dirty then write_sector disk secj sector else () in (* write back *)
          let sector = read_sector disk seci in
          let cache_line = Cache_Line (ref false,seci,sector) in
          set_ref r cache_line;
          sector

let update_sectorC1 : diskC1 -> int -> int -> int -> bytes -> unit =
  fun dc seci offset len new_bytes ->
  trace ("update_sectorC1 seci=" ^ sofi seci ^ ", offset=" ^ sofi offset ^ ", len=" ^ sofi len);
  match dc with
  | DiskC1 (disk,r) ->
     let cache_line = deref r in
     match cache_line with
     | Cache_Line (dirty,secj,sector) ->
        if seci = secj then
          let () = set_slice_bytes (deSector sector) offset len new_bytes in
          set_ref dirty true
        else
          let () = if deref dirty then write_sector disk secj sector else () in (* write back *)
          let sector = read_sector disk seci in
          let () = set_slice_bytes (deSector sector) offset len new_bytes in
          let cache_line = Cache_Line (ref true,seci,sector) in
          set_ref r cache_line


(* blocks: normally would be sized as some multiple of sectors, but my blocks are smaller *)

let block_size = 64
let blocks_per_sector = 8
let () = my_assert (block_size * blocks_per_sector = sector_size)

let num_blocks = blocks_per_sector * num_sectors
let () = my_assert (num_blocks = 256)

type block = Block of bytes
let deBlock thing = match thing with | Block x -> x

let bad_block_index i = if i < 0 then true else i >= num_blocks

let show_seci seci = "[" ^ sofi seci ^ "]"

let read_block : diskC1 -> int -> block =
  fun disk i ->
  if bad_block_index i then error ("read_block " ^ sofi i) else
    let seci = i / blocks_per_sector in
    let () = trace ("read_block " ^ sofi i ^ show_seci seci) in
    let sector = read_sectorC1 disk (i / blocks_per_sector) in
    let offset = block_size * (i % blocks_per_sector) in
    Block (get_slice_bytes (deSector sector) offset block_size)

let write_block : diskC1 -> int -> block -> unit =
  fun disk i block ->
  if bad_block_index i then error ("write_block " ^ sofi i) else
    let seci = i / blocks_per_sector in
    let () = trace ("write_block " ^ sofi i ^ show_seci seci) in
    let offset = block_size * (i % blocks_per_sector) in
    update_sectorC1 disk seci offset block_size (deBlock block)


(* driving code *)

let stripe_the_disk disk start stop =
  let rec loop i =
    if i > stop then () else
      let char = chr (ord '0' + (i % 10)) in
      let () = write_block disk i (Block (thaw_bytes (implode (replicate char block_size)))) in
      loop (i+1)
  in
  loop start

let splat_the_disk disk start stop =
  let rec loop i =
    if i > stop then () else
      let char = '-' in
      let () = write_block disk i (Block (thaw_bytes (implode (replicate char block_size)))) in
      loop (i+1)
  in
  loop start

let dump_the_disk disk start stop =
  let rec loop i =
    if i > stop then () else
      let block_string = freeze_bytes (deBlock (read_block disk i)) in
      put_string_newline (sofi i ^ " : " ^ block_string);
      loop (i+1)
  in
  loop start

let main () =
  let disk = make_diskC1 () in
  stripe_the_disk disk 101 124;
  splat_the_disk disk 114 119;
  dump_the_disk disk 100 125;
  ()
