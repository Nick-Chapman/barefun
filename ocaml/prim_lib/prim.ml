module X : sig

  val crash : unit -> 'a

  val ( * ) : int -> int -> int
  val (%) : int -> int -> int
  val (+) : int -> int -> int
  val (-) : int -> int -> int
  val (/) : int -> int -> int
  val (<) : int -> int -> bool
  val (=) : int -> int -> bool

  val chr : int -> char
  val eq_char : char -> char -> bool
  val get_char : unit -> char
  val ord : char -> int
  val put_char : char -> unit

  type 'a ref
  val ref : 'a -> 'a ref
  val (!) : 'a ref -> 'a
  val (:=) : 'a ref -> 'a -> unit

  type bytes
  val make_bytes : int -> bytes
  val set_bytes : bytes -> int -> char -> unit
  val get_bytes : bytes -> int -> char
  val freeze_bytes : bytes  -> string
  val thaw_bytes : string -> bytes
  val string_index : string -> int -> char
  val string_length : string -> int

  val load_sector : int -> bytes -> unit
  val store_sector : int -> string -> unit

  val free_words : unit -> int

  val wait_a_tick : unit -> unit
  val is_keyboard_ready : unit -> bool
  val get_keyboard_last_scancode : unit -> char

end = struct

  exception CRASH
  let crash () = raise CRASH

  let (=) = (=)
  let (<) = (<)
  let ( * ) = ( * )
  let (+) = (+)
  let (-) = (-)
  let (%) = (mod)
  let (/) = (/)

  let ord = Char.code
  let chr = Char.chr

  let eq_char = (=)
  let get_char () =
    let bytes = Bytes.create 1 in
    let n = Unix.read Unix.stdin bytes 0 1 in
    if n < 1 then (Printf.printf "[EOF]\n"; exit 0) else
      Bytes.get bytes 0

  let put_char : char -> unit = fun c ->
    let open Printf in
    let n = Char.code c in
    let printable = n >= 32 && n <= 126 in
    let nl = (n == 10) in
    let bs = (n == 8) in
    if printable || nl || bs then printf "%c%!" c else printf "\\%02x%!" n

  type 'a ref  = 'a Stdlib.ref
  let ref = Stdlib.ref
  let (!) = (!)
  let (:=) = (:=)

  type bytes = Bytes.t
  let make_bytes = Bytes.create
  let freeze_bytes = Bytes.(*unsafe_*)to_string
  let thaw_bytes = Bytes.(*unsafe_*)of_string
  let set_bytes = Bytes.set
  let get_bytes = Bytes.get

  let string_length = String.length
  let string_index s i = s.[i]

  let n_sectors = 32
  let sector_size = 512

  let open_fs_image() =
    let fd = Unix.openfile "/tmp/fs.image" [O_RDWR;O_CREAT] 0o640 in
    Unix.ftruncate fd (sector_size * n_sectors);
    fd

  let load_sector n buf =
    Printf.printf "[load_sector:%d]\n" n;
    if n < 0 then Printf.printf "[load_sector:%d]: too small\n" n else
      if n >= n_sectors then Printf.printf "[load_sector:%d]: too big\n" n else
        let fd = open_fs_image() in
        let pos = n * sector_size in
        let (_:int) = Unix.lseek fd pos SEEK_SET in
        let (_:int) = Unix.read fd buf 0 sector_size in
        ()

  let store_sector n s =
    Printf.printf "[store_sector:%d]\n" n;
    if n < 0 then Printf.printf "[store_sector:%d]: too small\n" n else
      if n >= n_sectors then Printf.printf "[store_sector:%d]: too big\n" n else
        let fd = open_fs_image() in
        let pos = n * sector_size in
        let (_:int) = Unix.lseek fd pos SEEK_SET in
        let (_:int) = Unix.write fd (Bytes.of_string s) 0 sector_size in
        ()

  let free_words () =
    0 (* return some dummy value *)


  let wait_a_tick : unit -> unit = fun () ->
    () (* TODO: really do a pause *)

  let is_keyboard_ready : unit -> bool = fun () ->
    true (* TODO: really check; don't lie *)

  let get_keyboard_last_scancode : unit -> char = fun () ->
    get_char() (* TODO: convert back to scancode for better emulation *)

end
include X
