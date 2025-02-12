^q.^u.^a.^r.^t.^e.^r.^..^q.M

:' ^^?> ^??> ;
:~ ^^?> ^??> ^>?> ;
:# 'L ~L, ~> ~, ;
:i ~L ^B?, ~>~H~@ 0# ~, ;
:t ~D~H~@~W~-~W~! ;

H@^(`0`E :( ~^ ^)# ~= i ~X t '(#~J ;

( Now we have comments! Preceeding defs are:
tick, compile, literal, if, then, open-paren:start-comment )

:h ~H~@ ; (here)
:j ~' 'L#~>~, 'J#~> ; (jump)
:q ~O~O~C~W~C~O~= i 0# ~= i ~P~P 01-# ~X t ~1~+~W~1~+ jq t ~P~P~P 0# ; (s=)
:p ~D~C~D i ~.~1~+ jp t ~P~P ; (type)
:n 11+D+D+D+D+#~W~< ; (is-white)
:k ~^~D~n i ~` ~X t ~P jk ; (skip-leading-whitespace)
:c ~^~D~n i ~` jc t ~P~0~`~X ; (collect-while-not-whitespace)
:v ~h~k~c ; (word,)
:w ~v~D~H~! ; (word)
:g ~D i ~D ~Y i ~G jg t ~O~O~N~q i ~W~P~X t ~G jg t ~P~P~0 ; (find-loop)
:u ~Z~g ; (find)
:f ~D~u~D i ~W~P~X t ~P ~p ^?# ~.~M~A~0; (find!)

( interpreter and compiler )
h ^]`0` h^[`0`E :[# ~w~W~O~q i ~P  ~X t ~D~f~D i ~W~P        ~V j[         t ~P~p ^?#~.~M~A j[;
h ^;`0`         :]# ~w~W~O~q i ~P~;~X t ~D~f~D i ~W~P ~D~I i ~V j] t ~> j] t ~P~p ^?#~.~M~A j];
h ^:`0`E ~v~E j] ;

h ^'`0`E ~w~f ; ( tick )
( Start the Forth Interpreter which was defined in quarter.q )
[

( Set the immediate bit on some words defined in quarter )

' [ immediate^
' ( immediate^

: immediate
latest immediate^ ;

: here  here-pointer @ ;

: literal ( comp: x -- ) ( run: -- x ) ( repeats ":#" in quarter )
[ ' lit ] lit [ , ] compile, , ; immediate


: [compile] ( "name" -- )
[ ' ' compile, ' compile, compile, ] ; immediate

: ['] ( comp: "name" ) ( run: -- xt )
' [compile] literal ; immediate


( compile is like postpone, but only for non-immediate words )
: compile ( "word" -- )
' ['] lit compile, , ['] compile, compile, ; immediate


: tail ( "name" -- )
' [compile] literal lit [ ' jump , ] compile, ; immediate

( Branch to beginning of current definition )
: recurse ( "word" -- )
( compile lit latest , compile jump ) ( OLD VERSION )
compile branch latest here - ,
; immediate


( We defined "if" and "then" as :i and :t in quarter )
( But we'll define them again here, and also "else" )

: ahead> ( -- a ) here 0 , ;
: <patch ( a -- ) dup here swap - swap ! ;

: if     ['] 0branch compile, ahead> ; immediate
: then   <patch                      ; immediate
: else   ['] branch compile, ahead> swap <patch ; immediate

: begin here ; immediate
: again ['] branch compile, here - , ; immediate

( Word )

: bl [ 1 1 + dup * dup * dup + ] literal ;

: is-white ( c -- flag ) bl swap < 0 1 - xor ; ( <= 32 )

: skip-leading-whitespace
key dup is-white if ( c )
drop recurse ( keep skipping... )
then c, ( collect first char ) ;

: collect-while-not-whitespace
key dup is-white if ( c )
drop 0 c, exit ( add null-terminator )
then c, recurse ( colect & keep collecting... ) ;

: word, ( "name" -- str )
here skip-leading-whitespace collect-while-not-whitespace ;

: word ( "name" -- str )
word, dup here-pointer ! ;

: char ( "c" -- c )
word c@ ;

: [char] ( comp: "name" -- ) ( run: -- c )
char [compile] literal ; immediate


( Nested comments )

( We defined basic comments in quarter.q -- now we define comments which properly nest. )

( TypeChecker not happy when recurse uses branch instead of jump )
: skip-to-close ( level -- )
key dup
[char] ( = if drop 1 + recurse then
[char] ) = if dup 0 = if drop exit then 1 - then
recurse ;

: (
0 skip-to-close ; immediate

( Now(we(have)nested)comments -- hurrah!)

( fi ( fo ) fum )


( Defining words )

: 2 [ 1 1 + ] literal ;
: 3 [ 2 1 + ] literal ;

( TypeChecker not happy with create/does>
: create
word, entry,
compile lit     ( 3 )
here 0 ,        ( 2 )
compile branch  ( 3 )
2 ,             ( 2 )
ret,
here swap !
;

: does> latest [ 3 2 3 + + ] literal + dup r> swap - swap !
;

: variable  create 0 , ;
: constant  create , does> @ ;
)

  ( Versions of constant/variable which avoid create/does> )
  : constant ( x "name" -- ) word, entry, compile lit , ret, ;
  : variable ( "name" -- ) here 0 , constant ;

( Emit a string -- repeats ":p" in quarter )
: type ( a -- )
dup c@ ( a c ) dup if ( a c ) emit ( a ) 1 + recurse
then drop drop ;


( Strings Literals... )

: collect-string
key dup [char] " = if exit
then c, recurse
;

( Compile code for a literal string, leaving address on stack )

: s" ( ..." -- string )
( make a branch slot )          ['] branch compile, ahead>
( note where string starts )    here swap
( collect the string chars )    collect-string drop ( the closing " )
( add a null )                  0 c,
( fill in the branch slot )     <patch
( push string at runtime )      ['] lit compile, ,
; immediate

( Compile code to emit a literal string )

: ." ( ..." )
['] s" execute
['] type compile,
; immediate

( Crash with string message )

: abort" ( ..." )
['] s" execute
['] type compile,
['] cr compile,
['] crash compile,
; immediate

( Print literal string while interpreting )

: .."
here
['] ." execute
ret,
(
dup execute
here-pointer ! ( TypeChecker not happy )
)
execute
;

( Now we can print a banner for this file )
.." forth.f" cr

: space     bl emit ;
: rot       >r swap r> swap ;
: -rot      swap >r swap r> ;

( hide )

: x-hide ( xt|0 -- )
dup if hidden^ exit then drop ( dont try to flip bit on a 0-xt )
;

: hide ( "name" -- ) ' x-hide ;

( Standard Forth words )

: allot     here swap + here-pointer ! ; ( appease TypeChecker with swap )

( This is a 16bit Forth; cell size is 2. Chars have size 1 )

: cell    ( -- n )          1 1 + ;     ( cell size )
: cells   ( n -- n )        cell * ;    ( multiply by cell size )
: cell+   ( n -- n )        cell + ;    ( increment by cell size +2 )
: char+   ( n -- n )        1 + ;       ( increment by char size +1 )
: chars   ( n -- n )        ;           ( multiply by char size *1, nop! )

( Output )

: space     [ bl ] literal emit ;
: spaces    dup if space 1 - recurse then drop ;

( Bools )

: false     ( -- b )        0 ;
: true      ( -- b )        [ 0 1 - ] literal ;
: or        ( b1 b2 -- b )  if drop true then ;         ( bool disjunction )
: and       ( b1 b2 -- b )  if exit then drop false ;   ( bool conjunction )
: invert    ( b -- b )      true xor ;                  ( bool negation )

( Stack manipulation )

( TypeChecker not happy with branch-dependent stack heights )
(
: ?dup  ( x -- 0 | x x )    dup if dup then ;   ( duplicate x if non-zero )
)
: nip   ( a b -- b )        swap drop ;         ( drop item under stack top. )

: 2dup  over over ;
: 2drop drop drop ;

( Numbers )

: >         swap < ;
: <=        > invert ;
: >=        < invert ;

: 0<      ( n -- flag )     0 < ;                       ( n is less than zero )
: 0=      ( n -- flag )     0 = ;                       ( n is zero )
: 1+      ( n1 -- n2 )      1 + ;                       ( increment )
: 1-      ( n1 -- n2 )      1 - ;                       ( decrement )

: negate  ( n1 -- n2 )      0 swap - ;                  ( arithmetic negation )
: abs     ( n -- u )        dup 0< if negate then ;     ( absolute value )

: min       over over > if swap then drop ;
: max       over over < if swap then drop ;

: mod ( n n -- n ) /mod drop ;

: /  ( a b -- a ) /mod nip ;

( Misc )

: +! ( n a ) swap over @ + swap ! ;

( Make the numbers we need )

1 1 +
constant 2

2 1 + dup * 1 +
constant 10

2 dup * dup *
constant 16

16 dup *
constant 256

( Non-blocking key check )

: akey?   key? 256 mod ;
: ekey?   key? 256 / ;


( Loops -- do..i..loop )

: do
compile >r
compile >r
here
; immediate

: i
compile r>
compile r>
compile dup
compile >r
compile swap
compile >r
; immediate

: loop
compile r>
compile r>
compile 1
compile +
compile 2dup
compile >r
compile >r
compile <
compile 0branch
here - ,
compile r>
compile r>
compile 2drop
; immediate

: erase ( a n -- )
dup 0= if 2drop exit then over 0 swap c! swap 1+ swap 1- recurse ;

( Support for numbers... )

( Behaviour of . and number? is modal  )

variable hex-mode

: hex       true  hex-mode ! ;
: decimal   false hex-mode ! ;

( Parse an unsigned hex or decimal number )

: decimal-digit? ( c -- flag ) dup [char] 0 >= swap [char] 9 <= and ;

: extended-digit? ( c -- flag ) dup [char] a >= swap [char] f <= and ;

: hex-digit? ( c -- flag )
dup decimal-digit? swap extended-digit? or ;

: digit? ( c -- flag )
hex-mode @ if hex-digit? else decimal-digit? then ;

: convert-digit
dup extended-digit?
if [char] a - 10 +
else [char] 0 -
then
;

: base ( -- n )
hex-mode @ if 16 else 10 then ;

: number-loop ( acc str -- u flag )
dup c@ dup 0 = if 2drop ( acc ) 1 exit
then ( acc str c ) dup digit? ( acc str c flag )
dup 0 = if 2drop drop 0 exit
then drop convert-digit rot base * + swap char+ ( acc' str' )
recurse
;

: number? ( str -- u flag )
0 swap number-loop ( s u 1 | s acc 0 )
;

( Print as unsigned decimal )

: print-digit ( 0-9 -- )
[char] 0 + emit
;

( expect TypeChecker difficulty here: recursive call at different stack height )
( i.e. polymorphic recursion; Mycroft recursion)
: dot-loop ( u -- )
dup 0= if drop exit ( stop; don't print leading zeros ) then
10 /mod ( u%10 u/10 -- ) dot-loop print-digit
;

: .decimal ( n -- ) ( output a value in decimal )
dup 0= if print-digit exit then ( special case for single "0" )
dot-loop
;

: .hex1 ( nibble -- ) ( output nibble as a length-1 hex string )
dup 10 < if print-digit exit then 10 - [char] a + emit ;

: .hex2 ( byte -- ) ( output byte as a length-2 hex string )
16 /mod .hex1 .hex1 ;

: .hex4 ( n -- ) ( output 16-bit cell-value as a length-4 hex string )
256 /mod .hex2 .hex2 ;

: .hex ( n -- ) ( output a value in hex )
.hex4 ;

: . ( u -- ) ( output value in hex/decimal, with trailing space )
hex-mode @ if .hex else .decimal then space ;

: ? ( addr -- ) @ . ;


( String equality -- repeats ":q" in quarter )

: s= ( a1 a2 -- flag )
over over c@ swap c@ over ( a1 a2 c2 c1 c2 ) = if
[ 0 ] literal = if drop drop [ 0 1 - ] literal exit then
1 + swap 1 + recurse
then drop drop drop [ 0 ] literal ;

( Find )

: find-loop ( s x -- x )
dup if ( s x )
dup hidden? if xt->next recurse then
over over ( s x s x ) xt->name ( s x s s2 ) s= if ( s x ) swap drop exit
then xt->next recurse
then ( s xt ) drop drop 0 ( xt might not be 0 in case word is hidden ) ;

: find ( string -- xt|0 ) latest find-loop ;
: find! ( "name" -- xt|0 )
dup find dup if swap drop exit then
swap type [char] ? emit cr crash-only-during-startup ;

( Tick )

: ' ( "word" -- xt )
word find! ;

( Colon compier: ":" )

: compiling
word
dup s" ;" s= if drop ret, exit then
dup find dup if swap drop dup immediate? if execute else compile, then recurse
then drop dup number? if nip ['] lit compile, , recurse
then drop ." ** Colon compiler: '" type ." ' ?" cr crash-only-during-startup recurse
;

: : word, entry, compiling ;

( Interpreter: "[" )

: [
word
dup s" ]" s= if drop exit then
dup find dup if swap drop execute recurse
then drop dup number? if nip recurse
then drop ." ** Interpreter: '" type ." ' ?" cr crash-only-during-startup recurse
; immediate

( And enter! ) [

hide .hex1
hide 10
hide 16
hide 2
hide 256
hide <patch
hide ahead>
hide base
hide collect-string
hide collect-while-not-whitespace
hide compiling
hide convert-digit
hide decimal-digit?
hide digit?
hide dot-loop
hide extended-digit?
hide find-loop
hide hex-digit?
hide hex-mode
hide is-white
hide number-loop
hide print-digit
hide skip-leading-whitespace
hide space


( Expect... )

: x
over = if drop exit then
." Expect failed, got: " . cr crash-only-during-startup
;

: banner s" Welcome to Quarter Forth. A 16-bit Forth system running on x86." ;

8 constant backspace-code
80 constant screen-width
: himem sp ;

14 16 * 8 + ( e8 )
constant call-op-code

12 16 * 3 + ( c3 )
constant ret-op-code

: @call
dup @ + 2 + ( @rel->abs )
;
.." Loading tools" cr

( Tools for exploring mem and defs )

: mem ( report bytes available )
himem here -
." Bytes available: "
. cr
;

( Not so useful.
  : memv ( report verbose memory usage info )
  ." Memory (hex)" cr
  here      ." here      = " as-num .hex4 cr
  sp        ." sp        = " as-num .hex4 cr
  sp0       ." sp0       = " as-num .hex4 cr
  sp here - ." Available = " .hex4 cr
  ;
)

( Dump colon definitions )

: is-call call-op-code = ;
: is-ret ret-op-code = ;

: is-xt-loop ( cand dict )
dup 0= if 2drop false exit then
2dup = if 2drop true exit then
xt->next recurse
;

: is-xt  latest is-xt-loop ;

( Disassemble code at a given address )

: is-call-slot ( addr -- bool )
dup c@ is-call
if 1 + @call is-xt
else drop false
then
;

: disassemble ( a -- )
dup is-call-slot if ( a )
  dup 1 + @call xt->name ( a name )
  type space ( a )
  3 + recurse
then
  dup c@ ( a c )
  dup is-ret if ( a c )
    drop drop
    [char] ; emit
    exit
  then
    .hex2
    ( a ) space
    1 + recurse
;

: x-see ( xt -- )
." : " dup xt->name type ."    "
dup disassemble
immediate? if ."  immediate" then
cr
;

: see ( "name" -- )
word find! dup if x-see then ;

( Show stack non destructively )

: .item
dup is-xt if xt->name [char] ' emit type space exit then .
;

: .s-continue
2 -
dup 2 - sp > if ( the 2 is for the extra item while processing )
dup @ .item
recurse
then
drop
;

: .s
sp0 .s-continue
;

: depth ( -- n )           ( depth of param stack )
sp sp0 swap - /2
;

: rdepth ( -- n )          ( depth of return stack )
rsp rsp0 swap - /2
;

: .?stack
depth if
." stack is not empty: < " .s [char] > emit cr
then
;

( "words": Print available words -- oldest first -- linear stack usage! )

: show-if-not-hidden ( xt -- )
dup hidden? if drop exit then xt->name type space
;

(
  : rev-words-continue ( xtEarlier xt -- xtEarlier xt )
  over over = if exit then
  dup -rot xt->next rev-words-continue rot
  dup show-if-not-hidden
  drop
  ;
  : words-since ( xtEarlier -- ) latest rev-words-continue drop drop ;
  : rev-words 0 words-since cr ;
)

( "words": Print available words -- newest first -- avoid linear stack usage )

: words-continue ( xt -- )
dup 0 = if drop cr exit then
dup show-if-not-hidden xt->next recurse
;

: words latest words-continue ;

( Repeated execution )

: times ( xt n -- ) ( call xt, n times )
dup if >r dup >r ( xt )
execute
r> r> ( xt n )
1 - recurse
then drop drop
;


( Pagination )

get-key constant old-key
: raw-key  old-key execute ;

: is-escape  27 = ;

: pag-continue ( xt a -- a' )
over execute
cr ." (press any key; escape to exit)" cr
raw-key is-escape if drop drop exit ( quit when escape key pressed )
then cr recurse ;

( Paginated dump )
: pag ( start-addr xt -- ) swap pag-continue ;


: is-printable? ( c -- bool ) dup 31 > swap 128 < and ;

: emit-printable-or-dot ( c -- )
dup is-printable? if emit exit then
drop [char] . emit ;


: drop-if-not-zero ( 0 -- | -- )
dup if drop then
;

: default-0 ( push a zero on the stack if it empty )
depth drop-if-not-zero
;

( Ascii char dump, paginated on 1k blocks )

screen-width 10 / 8 *
constant dump-width

: dc ( a -- a+1 ) dup c@ emit-printable-or-dot 1 + ;
: dump-line ( a -- a+64 ) dup .hex4 ." : " ['] dc dump-width times cr ;
: dump-page ( a -- a+1K ) ['] dump-line 16 times ;
: dump ( start-addr -- ) default-0 ['] dump-page pag ;

( xxd-style dump : hex-bytes + ascii to the side, paginated at 256 bytes )

dump-width 4 /
constant xxd-width

: emit-byte ( c -- ) .hex2 space ;
: db ( a -- a+1 ) dup c@ emit-byte 1 + ;
: xxd-line ( a -- a+16 )
dup .hex4 ." : " dup ['] db xxd-width times space drop ['] dc xxd-width times cr ;
: xxd-page ( a -- a+1K ) ['] xxd-line 16 times ;
: xxd ( start-addr -- ) default-0 ['] xxd-page pag ;

( See all defs, paginated in batches of 10 )

: see1 ( xt -- xt' )
dup if
dup x-see cr
xt->next
then
;

: see10 ( xt -- xt' ) ['] see1 10 times ;
: see-all
latest ['] see10 pag ( TODO: paginate )
;

hide .s-continue
hide db
hide dc
hide default-0
hide drop-if-not-zero
hide dump-line
hide dump-page
hide dump-width
hide emit-byte
hide emit-printable-or-dot
hide is-call
hide is-call-slot
hide is-escape
hide is-printable?
hide is-ret
hide is-xt-loop
hide old-key
hide pag
hide pag-continue
hide raw-key
hide see1
hide see10
hide show-if-not-hidden
hide words-continue
hide xxd-line
hide xxd-page
hide xxd-width
.." Loading regression" cr

( Stack manipulation )

1 2 3       3 x 2 x 1 x
1 2 3 drop  2 x 1 x
1 2 3 dup   3 x 3 x 2 x 1 x
1 2 3 swap  2 x 3 x 1 x
1 2 3 over  2 x 3 x 2 x 1 x
1 2 3 rot   1 x 3 x 2 x
1 2 3 nip   3 x 1 x
1 2 3 -rot  2 x 1 x 3 x

( Execution tokens )

: inc 1 + ;
' inc 1 swap execute                    2 x
' inc dup 1 swap execute swap execute   3 x

( Heap allocation )

here            here x
here 42 ,       here swap - cell x
here 7 allot    here 7 - x
3 cells         6 x

( Char )

bl          32 x
char *      42 x
char hi     104 x

: hi [char] h [char] i ;
hi 105 x 104 x

( Bools )

false invert    true x
true invert     false x

3 3 =           true x
3 4 =           false x
3 4 <           true x
4 3 <           false x
4 3 >           true x
3 4 >           false x

true true or    true x
true false or   true x
false true or   true x
false false or  false x

true true and    true x
true false and   false x
false true and   false x
false false and  false x

( Numbers )

3 4 + 7 x
4 3 + 7 x
2 5 - 65533 x
5 2 - 3 x
3 4 * 12 x
4 3 * 12 x

5 6 min 5 x
6 5 min 5 x
5 6 max 6 x
6 5 max 6 x

45 10 /mod    4 x 5 x
45 7 /mod     6 x 3 x
45 3 /mod    15 x 0 x
45 2 /mod    22 x 1 x
45 1 /mod    45 x 0 x

0 1 - constant -1 ( helper word for minus one! )

( Requires signed comparison )
-1 0<       true x
 0 0<       false x
 1 0<       false x
-1 0=       false x
 0 0=       true x
 1 0=       false x
 5 1+       6 x
 5 1-       4 x

 1 negate   -1 x
-1 negate    1 x

 1 abs     1 x
-1 abs     1 x

(
 1 0 ?dup   0 x 1 x
 1 2 ?dup   2 x 2 x 1 x
)


( misc: +! )

variable eggs
0 eggs !
: e 1 eggs +! ;

e e e e eggs @ 4 x
e e e eggs @ 7 x

(
  ( Test makes architectural assumptions... )
  variable v
  0 3 - v ! ( set v to -3 )
  ( c@ gets the bytes in little endian )
  v c@       253 x
  v 1 + c@   255 x
  hide v
)

( Cell and Char size )

5 cell+     7 x
5 char+     6 x
8 chars     8 x


( Parameter stack -- we have one item on stackk during this module )

(
depth      1 x
5 depth    2 x      drop
5 6 depth  3 x      drop drop
)


( "tail" is my tail call primitive; who needs loops?! )

: sq tail 1+ 1+ ;
7 sq   8 x


( Variables; fetch and store )

variable a
variable b
11 a !
22 b !
a @     11 x
b @     22 x
33 a !
a @     33 x
b @     22 x


( Constants )

1 constant one
2 constant two
one two         2 x 1 x


( Immediacy )

' here immediate?     false x
' dup immediate?      false x
' if immediate?       true x
' literal immediate?  true x

( Compilation )

42 : life literal ;
1 life 2                2 x 42 x 1 x


hide -1
hide a
hide b
hide e
hide eggs
hide hi
hide inc
hide life
hide one
hide sq
hide two
.." Loading examples" cr

( Large letter F. Adapted from "starting Forth", by Leo Brodie )

: star      [char] * emit ;
: stars     0 do star loop ;
: margin    cr 30 spaces ;
: blip      margin star ;
: bar       margin 5 stars ;
: F         bar blip bar blip blip cr ;


( Simple user examples )

: square    dup * ;
: fact      dup 1 > if dup 1 - fact * then ;
: fib       dup 1 > if dup 1 - fib swap 2 - fib + then ;

3 square    9 x
6 fact      720 x
10 fib      55 x


( Iterative version of factorial, making use of do..i..loop )

: fact-iterative ( n -- ) 1 swap 1 do i * loop ;

6 fact-iterative  720 x


: even? dup /2 2 * = ;

: collatz
dup .
dup 1 = if drop exit then
dup even? if /2 recurse then
3 * 1 + recurse
;

: z
27 collatz cr ;

( AHA - Use return stack to make useful version of twice )

: twice ( xt -- )
dup >r execute r> execute
;

3 ' square twice    81 x


hide bar
hide blip
hide even?
hide margin
hide square
hide star
hide stars
hide twice
.." Loading primes" cr

: divisible-by ( n1 n2  -- flag ) mod 0= ;

: any-divide ( n list -- flag )
dup c@ ( n list cand|0 ) dup 0= if drop 2drop false exit
then -rot swap rot over swap ( list n n cand )
divisible-by if 2drop true exit then
swap ( n list ) char+ recurse
;

( Fixed table of small primes below 16 )
here
2 c, 3 c, 5 c, 7 c, 11 c, 13 c, 0 c,
constant primes-below-16

: is-small-prime ( n -- flag ) primes-below-16 any-divide invert ;

: small-loop ( n list -- )
dup 256 = if drop exit then
dup is-small-prime if
dup c, ( write prime here )
then 1 + recurse
;

( Generate table of primes under 256 at compile time )
here
16 small-loop 0 c, ( end marker )
constant primes-below-256

: is-big-prime ( n -- flag )
dup
primes-below-16 any-divide if drop false exit then
primes-below-256 any-divide invert
;

: big-loop ( n list -- )
dup 0 = if drop exit then
dup is-big-prime if dup .
then 1 + recurse
;

: emit-list ( list -- )
dup c@ ( list elem ) dup 0= if 2drop exit then
( list n ) . char+ recurse
;

: primes
primes-below-16 emit-list
primes-below-256 emit-list
256 big-loop
;

hide any-divide
hide big-loop
hide divisible-by
hide emit-list
hide is-big-prime
hide is-small-prime
hide primes-below-16
hide primes-below-256
hide small-loop
.." Loading snake" cr

( x86 BIOS terminal control )

: set-block-cursor  7 set-cursor-shape ;
: set-underline-cursor  [ 6 256 * 7 + ] literal set-cursor-shape ;
: hide-cursor [ 32 256 * ] literal set-cursor-shape ;

: at-xy ( x y -- ) 256 * swap + set-cursor-position ;

: xy-read-char-col ( x y -- char col )
at-xy read-char-col
;

: xy-read-char ( x y -- char )
xy-read-char-col drop
;

: xy-read-col ( x y -- col )
xy-read-char-col nip
;

variable fg
variable bg

: colour 16 bg @ * fg @ + ;

: xy-emit ( x y char -- ) ( using fg; dont move cursor )
-rot at-xy colour write-char-col
;

 0 constant black
 1 constant blue
 2 constant green
 3 constant cyan
 4 constant red
 5 constant magenta
 6 constant brown
 7 constant light-grey
 8 constant dark-grey
 9 constant light-blue
10 constant light-green
11 constant light-cyan
12 constant light-red
13 constant light-magenta
14 constant yellow
15 constant white

white fg !
black bg !

( Repeated execution -- copied from tools )

: times ( xt n -- ) ( call xt, n times )
dup if >r dup >r ( xt )
execute
r> r> ( xt n )
1 - recurse
then drop drop
;

( Make a snake game... )

: block ( x y -- ) bl xy-emit ;
: block-right ( row col -- row col ) 2dup block swap 1+ swap ;
: block-down ( row col -- row col ) 2dup block 1+ ;

: border
red bg !
1 1 ['] block-right 78 times 2drop
1 2 ['] block-down 21 times 2drop
78 2 ['] block-down 21 times 2drop
1 23 ['] block-right 78 times 2drop
black bg !
;

( x/y pos of segment n )

: max-len 100 ;

here max-len 1 + cells allot constant xta
here max-len 1 + cells allot constant yta

: xpos ( n -- ) cells xta swap + ;
: ypos ( n -- ) cells yta swap + ;

variable direction
variable going-vertical
variable escaped
variable slowness ( 1.. )

variable len ( tail length -- full snake is 1 longer)

( These direction words change the position of segment 0, the snake head )

: -1   0 1 - ;

: left    0 xpos @ -1 + 0 xpos ! ;
: right   0 xpos @  1 + 0 xpos ! ;
: up      0 ypos @ -1 + 0 ypos ! ;
: down    0 ypos @  1 + 0 ypos ! ;
: nop ;

: set-start-state
25 0 xpos !
10 0 ypos !
['] right direction !
false going-vertical !
false escaped !
1 slowness !
0 len !
;

: move-head   direction @ execute ;
: set-dir ( xpos -- ) direction ! ;

: isH going-vertical @ 0= ;
: isV going-vertical @ ;
: setH false going-vertical ! ;
: setV true going-vertical ! ;

: shift-x ( n -- ) dup 1 - xpos @ swap xpos ! ;
: shift-y ( n -- ) dup 1 - ypos @ swap ypos ! ;
: shift-xy dup shift-x shift-y ;

: head-to-tail-loop ( n -- n' )
dup 0= if drop exit then
dup shift-xy 1 - recurse ;

: head-to-tail   len @ head-to-tail-loop ;

: clear-tail  len @ dup xpos @ swap ypos @ at-xy space ;

( Until I have food, lets increase the length every so many ticks )

: maybe-grow ( n -- )
10 mod 0 = if 1 len +!
67 0 at-xy ." Length = " len @ .
len @ shift-xy
then ;

: tick ( -- ) time dup maybe-grow 2drop ;
: tick2   tick tick ;

: pause1  going-vertical @ if tick then tick ; ( half speed when going vertical )
: do-pause   ['] pause1 slowness @ times ;

: speed-up slowness @ 1 - dup if slowness ! exit then drop ;

: is-escape  27 = ;
: is-return  13 = ;

: control ( ascii scan-code -- )
dup 72 = if isH if ['] up    set-dir setV then then
dup 80 = if isH if ['] down  set-dir setV then then
dup 75 = if isV if ['] left  set-dir setH then then
dup 77 = if isV if ['] right set-dir setH then then
over is-escape if true escaped ! then
over is-return if speed-up then
2drop
;

char @ constant snake-char

: draw-head   yellow fg ! 0 xpos @ 0 ypos @ snake-char xy-emit ;

: collide? ( -- flag )
0 xpos @ 0 ypos @ xy-read-char-col
16 / red = if drop true exit then
snake-char =
;

: wait KEY drop ;

: app-loop
do-pause
key? 256 /mod control
escaped @ if cls 0 0 at-xy ." Escape!" cr false exit then
clear-tail head-to-tail move-head
collide? if 1 0 at-xy ." CRASH" true exit then
draw-head
len @ max-len = if 1 0 at-xy ." YOU WIN            " wait wait true exit then
recurse
;

: snake
cls hide-cursor border
1 0 at-xy ." Target length: " max-len .
set-start-state
draw-head
app-loop ( again? )
if
."  (press any key to try again)" cr wait
snake
then
set-underline-cursor
;

hide -1
hide app-loop
hide at-xy
hide bg
hide black
hide block
hide block-down
hide block-right
hide blue
hide border
hide brown
hide clear-tail
hide collide?
hide colour
hide control
hide cyan
hide dark-grey
hide direction
hide do-pause
hide down
hide draw-head
hide escaped
hide fg
hide going-vertical
hide green
hide head-to-tail
hide head-to-tail-loop
hide hide-cursor
hide is-escape
hide is-return
hide isH
hide isV
hide left
hide len
hide light-blue
hide light-cyan
hide light-green
hide light-grey
hide light-magenta
hide light-red
hide magenta
hide max-len
hide maybe-grow
hide move-head
hide nop
hide pause1
hide red
hide right
hide set-block-cursor
hide set-dir
hide set-start-state
hide set-underline-cursor
hide setH
hide setV
hide shift-x
hide shift-xy
hide shift-y
hide slowness
hide snake-char
hide speed-up
hide tick
hide tick2
hide up
hide wait
hide white
hide xpos
hide xta
hide xy-emit
hide xy-read-char
hide xy-read-char-col
hide xy-read-col
hide yellow
hide ypos
hide yta
.." Loading buffer" cr

get-key constant old-key
: raw-key  old-key execute ;

79 constant key-buffer-size ( not 80, so blinking cursor remains on line )

here
key-buffer-size 2 + allot ( +2 for the newline & null )
constant key-buffer
0 key-buffer c!

: at-start-of-buffer      ( a -- flag ) key-buffer = ;
: is-space-left-in-buffer ( a -- flag ) key-buffer - key-buffer-size < ;

: is-newline dup 13 = swap 10 = or ;
: is-backspace backspace-code = ;
: is-printable dup 32 >= swap 126 <= and ;


( Replace the inner echo-{enabled,on,off} )
echo-enabled @
hide echo-enabled
variable echo-enabled
echo-enabled !
echo-off
hide echo-on
hide echo-off
: echo-on true echo-enabled ! ;
: echo-off false echo-enabled ! ;
: echo echo-enabled @ if emit exit then drop ;

: ok
echo-enabled @ if ."  ok" cr then ;

: -1   0 1 - ;

: fill-loop ( a -- a' )
raw-key ( a c )
over over swap ( a c c a ) c!

( a c ) dup is-newline if ( a c )
echo 1 + ( show newline and record in buffer )
exit ( stop filling )

then ( a c ) dup is-backspace if ( a c )

over at-start-of-buffer if drop recurse ( ignore backspace )

then dup echo space echo ( Handle the backspace visually )
-1 + tail fill-loop ( Move the pointer back one step  )

then dup is-printable 0= if drop recurse ( ignore non-printable )

then over is-space-left-in-buffer 0= if drop recurse ( ignore char )

then ( a c )
echo 1 + ( show char and record in buffer )
recurse
;

: fill
( s" filling..." type cr ) ( PROBLEM )
ok
key-buffer fill-loop
0 swap c! ( add null so we know when the buffer is exhausted )
( s" filling... done!" type cr ) ( PROBLEM )
;

variable kb-pointer : reset-kb-pointer key-buffer kb-pointer ! ;
reset-kb-pointer

: buffered-key ( -- c )
( [char] * emit )
kb-pointer @ c@
dup if ( c )
1 kb-pointer +!
exit
then drop
reset-kb-pointer fill buffered-key
;

' buffered-key set-key ( Install the buffered-key input routine )

( All text which follows must be within the max line length )

hide -1
hide at-start-of-buffer
hide buffered-key
hide echo
hide fill
hide fill-loop
hide is-newline
hide is-printable
hide is-backspace
hide is-space-left-in-buffer
hide kb-pointer
hide key-buffer
hide key-buffer-size
hide ok
hide old-key
hide raw-key
hide reset-kb-pointer
( Lines in this file must be within 79 cols, because buffered input may be on )

cr
banner type cr
cr
mem cr
.?stack

startup-is-complete
hide startup-is-complete
hide crash-only-during-startup
echo-on
