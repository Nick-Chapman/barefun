(*Stage1 (Exp)*)
let + = (fun x -> (fun y -> PRIM_AddInt(x,y))) in
let % = (fun x -> (fun y -> PRIM_ModInt(x,y))) in
let ( * ) = (fun x -> (fun y -> PRIM_MulInt(x,y))) in
let - = (fun x -> (fun y -> PRIM_SubInt(x,y))) in
let / = (fun x -> (fun y -> PRIM_DivInt(x,y))) in
let :: = (fun x -> (fun y -> Cons1(x, y))) in
let < = (fun x -> (fun y -> PRIM_LessInt(x,y))) in
let = = (fun x -> (fun y -> PRIM_EqInt(x,y))) in
let chr = (fun x -> PRIM_CharChr(x)) in
let eq_char = (fun x -> (fun y -> PRIM_EqChar(x,y))) in
let get_char = (fun x -> PRIM_GetChar(x)) in
let ord = (fun x -> PRIM_CharOrd(x)) in
let put_char = (fun x -> PRIM_PutChar(x)) in
let string_index = (fun x -> (fun y -> PRIM_StringIndex(x,y))) in
let string_length = (fun x -> PRIM_StringLength(x)) in
let make_bytes = (fun x -> PRIM_MakeBytes(x)) in
let freeze_bytes = (fun x -> PRIM_FreezeBytes(x)) in
let thaw_bytes = (fun x -> PRIM_ThawBytes(x)) in
let set_bytes = (fun x -> (fun y -> (fun z -> PRIM_SetBytes(x,y,z)))) in
let get_bytes = (fun x -> (fun y -> PRIM_GetBytes(x,y))) in
let ref = (fun x -> PRIM_MakeRef(x)) in
let deref = (fun x -> PRIM_DeRef(x)) in
let set_ref = (fun x -> (fun y -> PRIM_SetRef(x,y))) in
let crash = (fun x -> PRIM_Crash(x)) in
let trace0_on = true1 in
let trace_on = false0 in
let @@ = (fun f -> (fun x -> (f x))) in
let not =
  (fun b ->
    match b with
    | true1 -> false0
    | false0 -> true1) in
let > = (fun a -> (fun b -> ((< b) a))) in
let >= = (fun a -> (fun b -> (not ((< a) b)))) in
let noinline =
  let block =
    fix (fun block f ->
      (fun a ->
        let _ = block in
        (f a))) in
  block in
let length =
  fix (fun length xs ->
    match xs with
    | Nil0 -> 0
    | Cons1(_,xs) -> ((+ 1) (length xs))) in
let rev_onto =
  fix (fun rev_onto acc ->
    (fun xs ->
      match xs with
      | Nil0 -> acc
      | Cons1(x,xs) -> ((rev_onto ((:: x) acc)) xs))) in
let rev = (fun xs -> ((rev_onto Nil0) xs)) in
let @ = (fun xs -> (fun ys -> ((rev_onto ys) (rev xs)))) in
let implode =
  ((@@ noinline)
  (fun xs ->
    let b = (make_bytes (length xs)) in
    let loop =
      fix (fun loop i ->
        (fun xs ->
          match xs with
          | Nil0 -> Unit0
          | Cons1(x,xs) ->
            let _ = (((set_bytes b) i) x) in
            ((loop ((+ i) 1)) xs))) in
    let _ = ((loop 0) xs) in
    (freeze_bytes b))) in
let explode =
  (noinline
  (fun s ->
    let explode_loop =
      fix (fun explode_loop acc ->
        (fun i ->
          match ((< i) 0) with
          | true1 -> acc
          | false0 -> ((explode_loop ((:: ((string_index s) i)) acc)) ((- i) 1)))) in
    ((explode_loop Nil0) ((- (string_length s)) 1)))) in
let ^ = (fun s1 -> (fun s2 -> (implode ((@ (explode s1)) (explode s2))))) in
let put_char =
  (fun c ->
    let backspace = 8 in
    let n = (ord c) in
    match ((= n) backspace) with
    | true1 -> (put_char c)
    | false0 ->
      match ((eq_char c) '\n') with
      | true1 -> (put_char c)
      | false0 ->
        match ((> n) 26) with
        | true1 -> (put_char c)
        | false0 ->
          let _ = (put_char '^') in
          (put_char (chr ((- ((+ (ord 'A')) n)) 1)))) in
let put_chars =
  fix (fun put_chars xs ->
    match xs with
    | Nil0 -> Unit0
    | Cons1(x,xs) ->
      let _ = (put_char x) in
      (put_chars xs)) in
let put_string = (fun s -> (put_chars (explode s))) in
let newline = (fun _ -> (put_char '\n')) in
let chars_of_int =
  (fun i ->
    let ord0 = (ord '0') in
    let char_of_digit = (fun c -> (chr ((+ ord0) c))) in
    let loop =
      fix (fun loop acc ->
        (fun i ->
          match ((= i) 0) with
          | true1 -> acc
          | false0 -> ((loop ((:: (char_of_digit ((% i) 10))) acc)) ((/ i) 10)))) in
    match ((= i) 0) with
    | true1 -> Cons1('0', Nil0)
    | false0 -> ((loop Nil0) i)) in
let put_string_newline =
  (fun s ->
    let _ = (put_string s) in
    (newline Unit0)) in
let sofi = (fun i -> (implode (chars_of_int i))) in
let replicate =
  (fun x ->
    let loop =
      fix (fun loop acc ->
        (fun i ->
          match ((= i) 0) with
          | true1 -> acc
          | false0 -> ((loop ((:: x) acc)) ((- i) 1)))) in
    (loop Nil0)) in
let error =
  (fun m ->
    let _ = (put_string ((^ "error: ") ((^ m) "\n"))) in
    (crash Unit0)) in
let trace0 =
  (fun m ->
    match trace0_on with
    | true1 -> (put_string ((^ "trace: ") ((^ m) "\n")))
    | false0 -> Unit0) in
let trace =
  (fun m ->
    match trace_on with
    | true1 -> (put_string ((^ "trace: ") ((^ m) "\n")))
    | false0 -> Unit0) in
let my_assert =
  (fun b ->
    match b with
    | true1 -> Unit0
    | false0 -> (error "assert failed")) in
let get_slice_bytes =
  (fun source ->
    (fun offset ->
      (fun len ->
        let target = (make_bytes len) in
        let loop =
          fix (fun loop i ->
            match ((>= i) len) with
            | true1 -> Unit0
            | false0 ->
              let char = ((get_bytes source) ((+ offset) i)) in
              let _ = (((set_bytes target) i) char) in
              (loop ((+ i) 1))) in
        let _ = (loop 0) in
        target))) in
let set_slice_bytes =
  (fun target ->
    (fun offset ->
      (fun len ->
        (fun source ->
          let loop =
            fix (fun loop i ->
              match ((>= i) len) with
              | true1 -> Unit0
              | false0 ->
                let char = ((get_bytes source) i) in
                let _ = (((set_bytes target) ((+ offset) i)) char) in
                (loop ((+ i) 1))) in
          (loop 0))))) in
let deDisk =
  (fun thing ->
    match thing with
    | Disk0(x) -> x) in
let num_sectors = 32 in
let sector_size = 512 in
let disk_size = ((( * ) num_sectors) sector_size) in
let make_disk = (fun _ -> Disk0((make_bytes disk_size))) in
let deSector =
  (fun thing ->
    match thing with
    | Sector0(x) -> x) in
let bad_sector_index =
  (fun i ->
    match ((< i) 0) with
    | true1 -> true1
    | false0 -> ((>= i) num_sectors)) in
let read_sector =
  (fun disk ->
    (fun seci ->
      match (bad_sector_index seci) with
      | true1 -> (error ((^ "read_sector ") (sofi seci)))
      | false0 ->
        let _ = (trace0 ((^ "read_sector ") ((^ (sofi seci)) "   **SLOW**"))) in
        Sector0((((get_slice_bytes (deDisk disk)) ((( * ) seci) sector_size)) sector_size)))) in
let write_sector =
  (fun disk ->
    (fun seci ->
      (fun sector ->
        match (bad_sector_index seci) with
        | true1 -> (error ((^ "write_sector ") (sofi seci)))
        | false0 ->
          let _ = (trace0 ((^ "write_sector ") ((^ (sofi seci)) "   **SLOW**"))) in
          ((((set_slice_bytes (deDisk disk)) ((( * ) seci) sector_size)) sector_size) (deSector sector))))) in
let make_diskC1 =
  (fun _ ->
    let disk = (make_disk Unit0) in
    let seci = 0 in
    let sector = ((read_sector disk) seci) in
    let cache_line = Cache_Line0((ref false0), seci, sector) in
    DiskC10(disk, (ref cache_line))) in
let read_sectorC1 =
  (fun dc ->
    (fun seci ->
      let _ = (trace ((^ "read_sectorC1 seci=") (sofi seci))) in
      match dc with
      | DiskC10(disk,r) ->
        let cache_line = (deref r) in
        match cache_line with
        | Cache_Line0(dirty,secj,sector) ->
          match ((= seci) secj) with
          | true1 -> sector
          | false0 ->
            let _ =
              match (deref dirty) with
              | true1 -> (((write_sector disk) secj) sector)
              | false0 -> Unit0 in
            let sector = ((read_sector disk) seci) in
            let cache_line = Cache_Line0((ref false0), seci, sector) in
            let _ = ((set_ref r) cache_line) in
            sector)) in
let update_sectorC1 =
  (fun dc ->
    (fun seci ->
      (fun offset ->
        (fun len ->
          (fun new_bytes ->
            let _ = (trace ((^ "update_sectorC1 seci=") ((^ (sofi seci)) ((^ ", offset=") ((^ (sofi offset)) ((^ ", len=") (sofi len))))))) in
            match dc with
            | DiskC10(disk,r) ->
              let cache_line = (deref r) in
              match cache_line with
              | Cache_Line0(dirty,secj,sector) ->
                match ((= seci) secj) with
                | true1 ->
                  let _ = ((((set_slice_bytes (deSector sector)) offset) len) new_bytes) in
                  ((set_ref dirty) true1)
                | false0 ->
                  let _ =
                    match (deref dirty) with
                    | true1 -> (((write_sector disk) secj) sector)
                    | false0 -> Unit0 in
                  let sector = ((read_sector disk) seci) in
                  let _ = ((((set_slice_bytes (deSector sector)) offset) len) new_bytes) in
                  let cache_line = Cache_Line0((ref true1), seci, sector) in
                  ((set_ref r) cache_line)))))) in
let block_size = 64 in
let blocks_per_sector = 8 in
let _ = (my_assert ((= ((( * ) block_size) blocks_per_sector)) sector_size)) in
let num_blocks = ((( * ) blocks_per_sector) num_sectors) in
let _ = (my_assert ((= num_blocks) 256)) in
let deBlock =
  (fun thing ->
    match thing with
    | Block0(x) -> x) in
let bad_block_index =
  (fun i ->
    match ((< i) 0) with
    | true1 -> true1
    | false0 -> ((>= i) num_blocks)) in
let show_seci = (fun seci -> ((^ "[") ((^ (sofi seci)) "]"))) in
let read_block =
  (fun disk ->
    (fun i ->
      match (bad_block_index i) with
      | true1 -> (error ((^ "read_block ") (sofi i)))
      | false0 ->
        let seci = ((/ i) blocks_per_sector) in
        let _ = (trace ((^ "read_block ") ((^ (sofi i)) (show_seci seci)))) in
        let sector = ((read_sectorC1 disk) ((/ i) blocks_per_sector)) in
        let offset = ((( * ) block_size) ((% i) blocks_per_sector)) in
        Block0((((get_slice_bytes (deSector sector)) offset) block_size)))) in
let write_block =
  (fun disk ->
    (fun i ->
      (fun block ->
        match (bad_block_index i) with
        | true1 -> (error ((^ "write_block ") (sofi i)))
        | false0 ->
          let seci = ((/ i) blocks_per_sector) in
          let _ = (trace ((^ "write_block ") ((^ (sofi i)) (show_seci seci)))) in
          let offset = ((( * ) block_size) ((% i) blocks_per_sector)) in
          (((((update_sectorC1 disk) seci) offset) block_size) (deBlock block))))) in
let stripe_the_disk =
  (fun disk ->
    (fun start ->
      (fun stop ->
        let loop =
          fix (fun loop i ->
            match ((> i) stop) with
            | true1 -> Unit0
            | false0 ->
              let char = (chr ((+ (ord '0')) ((% i) 10))) in
              let _ = (((write_block disk) i) Block0((thaw_bytes (implode ((replicate char) block_size))))) in
              (loop ((+ i) 1))) in
        (loop start)))) in
let splat_the_disk =
  (fun disk ->
    (fun start ->
      (fun stop ->
        let loop =
          fix (fun loop i ->
            match ((> i) stop) with
            | true1 -> Unit0
            | false0 ->
              let char = '-' in
              let _ = (((write_block disk) i) Block0((thaw_bytes (implode ((replicate char) block_size))))) in
              (loop ((+ i) 1))) in
        (loop start)))) in
let dump_the_disk =
  (fun disk ->
    (fun start ->
      (fun stop ->
        let loop =
          fix (fun loop i ->
            match ((> i) stop) with
            | true1 -> Unit0
            | false0 ->
              let block_string = (freeze_bytes (deBlock ((read_block disk) i))) in
              let _ = (put_string_newline ((^ (sofi i)) ((^ " : ") block_string))) in
              (loop ((+ i) 1))) in
        (loop start)))) in
let main =
  (fun _ ->
    let disk = (make_diskC1 Unit0) in
    let _ = (((stripe_the_disk disk) 101) 124) in
    let _ = (((splat_the_disk disk) 114) 119) in
    let _ = (((dump_the_disk disk) 100) 125) in
    Unit0) in
(main Unit0)
