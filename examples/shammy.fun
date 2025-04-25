
(* shammy: smaller version of the sham example *)

let (@@) f x = f x

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
  | _::xs -> (+) 1 (length xs)

let rec map f xs =
  match xs with
  | [] -> []
  | x::xs -> f x :: map f xs

let rec iter f xs =
  match xs with
  | [] -> ()
  | x::xs -> f x; iter f xs

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

let rev_implode = noinline(fun xs ->
  let n = length xs in
  let b = make_bytes n in
  let rec loop i xs =
    match xs with
    | [] -> ()
    | x::xs -> set_bytes b i x; loop (i-1) xs
  in
  loop (n-1) xs;
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

let rec concat xs =
  match xs with
  | [] -> ""
  | x::xs -> x ^ concat xs

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

let chars_of_int i =
  let ord0 = ord '0' in
  let char_of_digit c = chr (ord0 + c) in
  let rec loop acc i =
    if i = 0 then acc else
      loop (char_of_digit (i%10) :: acc) (i/10)
  in
  if i = 0 then ['0'] else loop [] i

let put_int i = put_chars (chars_of_int i)

let newline () = put_char '\n'

(* read_line *)

let erase_char () =
  let backspace = chr 8 in
  (* erase the previously echoed char on the terminal *)
  put_char backspace;
  put_char ' ';
  put_char backspace

let read_line () =
  let rec readloop acc =
    let c = get_char () in
    let n = ord c in
    let controlD = chr 4 in
    if eq_char c '\n' then (newline(); rev_implode acc) else
      if eq_char c controlD then (put_char controlD; newline(); rev_implode (controlD :: acc)) else
        if n > 127 then readloop acc else
          if n = 127 then
            match acc with
            | [] -> readloop acc
            | c::tail ->
               (if ord c <= 26 then erase_char () else ()); (* The ^ printed for control chars *)
               erase_char();
               readloop tail
          else
            (put_char c; readloop (c :: acc))
  in
  readloop []

let split_words =
  let rec at_word_start accWs =
    let rec have_letter accWs accCs xs =
      match xs with
      | [] -> rev_implode accCs :: accWs
      | x::xs ->
         if eq_char x ' ' then at_word_start (rev_implode accCs :: accWs) xs
         else have_letter accWs (x::accCs) xs
    in
    fun xs ->
    match xs with
    | [] ->  accWs
    | x::xs ->
       if eq_char x ' ' then at_word_start accWs xs else
         have_letter accWs [x] xs

  in
  fun s -> rev (at_word_start [] (explode s))

type 'a option = None | Some of 'a

type ('a,'b) pair = Pair of 'a * 'b
type 'file fs = Bindings of (string, 'file) pair list
type file = Data of string | Executable of (file fs -> string list -> file fs)

let bindings fs = match fs with | Bindings(ps) -> ps

let lookup = fun sought ->
  let rec loop ps =
    match ps with
    | [] -> None
    | e1::ps ->
       match e1 with
       | Pair (name,file) ->
          if eq_string name sought then Some file else loop ps
  in
  fun fs -> loop (bindings fs)

let put_space_sep_strings xs =
  let rec loop xs =
    match xs with
    | [] -> ()
    | x::xs -> put_char ' '; put_string x; loop xs
  in
  match xs with
    | [] -> ()
    | x::xs -> put_string x; loop xs

let dispatch fs command args =
  let err m = put_string ("sham: "^command^": "^m^"\n") in
  match lookup command fs with
  | None -> err "command not found"; fs
  | Some file ->
     match file with
     | Data _ -> err "Permission denied"; fs
     | Executable (f) -> f fs args

let execute fs line =
  match split_words line with
  | [] -> fs
  | command::args -> dispatch fs command args

let rec mainloop fs =
  put_string "% ";
  let single_controlD = implode (chr 4 :: []) in
  let line = read_line () in
  if eq_string line single_controlD then () else
    let fs = execute fs line in
    mainloop fs

let ls_behaviour fs args =
  match args with
  | _::_ -> put_string "ls: takes no arguments\n";fs
  | [] ->
     let just_name p = match p with | Pair (name,_) -> name in
     (put_space_sep_strings (map just_name (bindings fs)); newline(); fs)

let cat_behaviour fs args =
  let cat1 x =
    match lookup x fs with
    | None -> put_string (concat ["cat: ";x;" : No such file or directory\n"])
    | Some(file) ->
       match file with
       | Data s -> put_string s
       | Executable (_) -> put_string (concat ["cat: ";x;" : Not a data file\n"])
  in
  match args with
  | [] -> (put_string "cat: takes at least one argument\n"; fs)
  | x::xs -> (cat1 x; iter cat1 xs; fs)

let rec fib n =
  if n < 2 then n else fib (n-1) + fib (n-2)

let runfib n =
  let rec loop i =
    if i > n then () else
      let res = fib i in
      put_string "fib ";
      put_int i;
      put_string " --> ";
      put_int res;
      newline ();
      loop (i+1)
  in
  loop 0

let parse_digit c =
  let n = ord c - ord '0' in
  if n >= 0 then if n <= 9 then Some n else None else None

let parse_num s =
  let rec loop acc xs =
    match xs with
    | [] -> Some(acc)
    | x::xs ->
        match parse_digit x with
        | None -> None
        | Some d -> loop (10 * acc + d) xs
  in
  loop 0 s

let fib_behaviour fs args =
  match args with
  | [] -> (put_string "fib: missing argument\n"; fs)
  | arg1::args ->
     match args with
     | _::_ -> (put_string "create: unexpected extra argument\n"; fs)
     | [] ->
        match parse_num (explode arg1) with
        | None -> (put_string "fib: expected numeric argument"; fs)
        | Some n ->
           runfib n; fs

let readme = "Welcome to sham; please try all the commands!\n"

let fs0() = Bindings(
  [ Pair ("readme", Data (readme))
  ; Pair ("cat", Executable (cat_behaviour))
  ; Pair ("ls", Executable (ls_behaviour))
  ; Pair ("fib", Executable (fib_behaviour))
  ])

let main () =
  put_string "Shammy: In-memory file-system. Consider typing \"ls\".\n";
  mainloop (fs0())
