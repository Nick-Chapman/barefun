
(* Small example to show the power of NBE to blast through our abstractions *)

let read1 () = (* echoing read. i.e. get/put *)
  let c = get_char () in
  put_char c;
  c

type trip = Trip of char * char * char

let newline() = put_char '\n'

let read3 () =
  (*let t = Trip(read1(),read1(),read1()) in*) (*Shows right->left argument evaluation semantics*)
  let a = read1() in
  let b = read1() in
  let c = read1() in
  let t = Trip(a,b,c) in
  newline();
  t

let put3_n t = (* no newline *)
  match t with
  | Trip(a,b,c) -> put_char a; put_char b; put_char c

let put3 t = (* with a newline *)
  put3_n t; newline()

let rot3 t =
  match t with
  | Trip(a,b,c) -> Trip(b,c,a)

let main () =
  let prompt = Trip('3','>',' ') in
  put3_n prompt;
  let a = read3() in
  put3(a);
  let b = rot3 a in
  let c = rot3 b in
  put3 b;
  put3 c;
  put3 (rot3 c)
