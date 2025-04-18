module X : sig

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
  val set_bytes : bytes -> int -> char -> unit

end = struct

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
    let dontEscape = (32 <= n && n <= 126) || n = 8 || c = '\n' in
    if dontEscape then printf "%c%!" c else printf "%s%!" (Char.escaped c)

  let upto i j =
    let rec loop acc i = if i > j then List.rev acc else loop (i::acc) (i+1) in
    loop [] i

  let string_length = String.length
  let string_index s i = s.[i]

  type bytes = Bytes.t
  let make_bytes = Bytes.create
  let freeze_bytes = Bytes.unsafe_to_string
  let set_bytes = Bytes.set

end
include X
