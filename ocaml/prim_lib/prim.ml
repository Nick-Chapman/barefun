
(* TODO: define the Prim signature explicitly *)

let eq_char : char -> char -> bool = fun c1 c2 ->
  c1 = c2

let get_char : unit -> char = fun () ->
  let bytes = Bytes.create 1 in
  let n = Unix.read Unix.stdin bytes 0 1 in
  if n < 1 then (Printf.printf "[EOF]\n"; exit 0) else
  let c : char = Bytes.get bytes 0 in
  c

let put_char : char -> unit = fun c ->
  let open Printf in
  let n = Char.code c in
  let dontEscape = (32 <= n && n <= 126) || n = 8 || c = '\n' in
  if dontEscape then printf "%c%!" c else printf "%s%!" (Char.escaped c)

let eq_int : int -> int -> bool = fun x1 x2 ->
  x1 = x2

let less_int : int -> int -> bool = fun x1 x2 ->
  x1 < x2

let ( * ) : int -> int -> int = ( * )
let (+) : int -> int -> int = (+)
let (-) : int -> int -> int = (-)
let (%) : int -> int -> int = (mod)
let (/) : int -> int -> int = (/)
let ord : char -> int = Char.code
let chr : int -> char = Char.chr

let upto : int -> int -> int list =
  fun i j ->
  let rec loop acc i = if i > j then List.rev acc else loop (i::acc) (i+1) in
  loop [] i

(* TODO: move explode into example.fun, defined using lower level primitives *)
let explode : string -> char list =
  fun s ->
  List.map (fun i -> s.[i]) (upto 0 (String.length s - 1))
