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
  (* TODO: length op is missing *)
  val set_bytes : bytes -> int -> char -> unit
  val get_bytes : bytes -> int -> char

  val freeze_bytes : bytes  -> string
  val thaw_bytes : string -> bytes
  val string_index : string -> int -> char
  val string_length : string -> int

  val load_sector : int -> bytes -> unit
  val store_sector : int -> string -> unit

  val get_sp : unit -> int

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

  let load_sector n _ =
    Printf.printf "[load_sector:%d]\n" n

  let store_sector n _ =
    Printf.printf "[store_sector:%d]\n" n

  let get_sp () =
    777 (* return some dummy value *)

end
include X
