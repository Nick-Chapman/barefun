module X : sig

  val ( * ) : int -> int -> int
  val (%) : int -> int -> int
  val (+) : int -> int -> int
  val (-) : int -> int -> int
  val (/) : int -> int -> int
  val chr : int -> char
  val eq_char : char -> char -> bool
  val eq_int : int -> int -> bool
  val explode : string -> char list
  val get_char : unit -> char
  val less_int : int -> int -> bool
  val ord : char -> int
  val put_char : char -> unit
  val upto : int -> int -> int list

end = struct

  let eq_int = (=)
  let less_int = (<)
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

  let explode s =  (* TODO: define in example.fun, using lower level primitives *)
    List.map (fun i -> s.[i]) (upto 0 (String.length s - 1))

end
include X
