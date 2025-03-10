
(* Repl example coded directly in ocaml as a starting point for compilation. *)

type 'a my_list = Nil | Cons of 'a * 'a my_list

let read_line : unit -> char my_list =
  let rec loop acc =
    let c = Prim.get_char () in
    Prim.put_char c;
    if not (Prim.eq_char c '\n') then loop (Cons (c,acc)) else acc
  in
  fun () -> loop Nil

let rec put_chars xs =
  match xs with
  | Nil -> ()
  | Cons (x,xs) -> Prim.put_char x; put_chars xs

let start : unit -> _ =
  let rec loop () =
    Prim.put_char '>';
    let xs = read_line () in
    put_chars xs;
    Prim.put_char '\n';
    loop ()
  in
  loop
