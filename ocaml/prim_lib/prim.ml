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
  val string_index : string -> int -> char
  val string_length : string -> int
  val upto : int -> int -> int list

  type bytes
  val make_bytes : int -> bytes
  val freeze_bytes : bytes  -> string
  val thaw_bytes : string -> bytes
  val set_bytes : bytes -> int -> char -> unit
  val get_bytes : bytes -> int -> char

  type 'a ref
  val ref : 'a -> 'a ref
  val deref : 'a ref -> 'a (* TODO: (!) *)
  val (:=) : 'a ref -> 'a -> unit

  val load_sector_and_dump : int -> unit
  val load_sector : int -> bytes -> unit

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

  let upto i j =
    let rec loop acc i = if i > j then List.rev acc else loop (i::acc) (i+1) in
    loop [] i

  let string_length = String.length
  let string_index s i = s.[i]

  type bytes = Bytes.t
  let make_bytes = Bytes.create
  let freeze_bytes = Bytes.(*unsafe_*)to_string
  let thaw_bytes = Bytes.(*unsafe_*)of_string
  let set_bytes = Bytes.set
  let get_bytes = Bytes.get

  type 'a ref  = 'a Stdlib.ref
  let ref = Stdlib.ref
  let deref = (!)
  let (:=) = (:=)

  let load_sector_and_dump n =
    Printf.printf "[load_sector_and_dump:%d]\n" n

  let load_sector n _ =
    Printf.printf "[load_sector:%d]\n" n

end
include X
