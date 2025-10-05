```
:M
  `=== TIC-TAC-TOE ===` /N
  /N
  `1) Play Game` /N
  `2) Quit` /N
  /N
  `Enter choice: ` 
;

:G
  /U (
    M
    /K
    50 =
    (
      `Goodbye!` /N 
      /F
    )
    /E
    (
      `Starting game...` /N /N
      /T
    )
  /W )
;



:B [ 0 0 0 0 0 0 0 0 0 ] ;
B b !



:L
  `---+---+---` /N
;

:R
  b q ? " 0 = ( 32 ) /E ( " 1 = ( 88 ) /E ( 79 ) ) /C
  ` | ` q 1 + q !
  b q ? " 0 = ( 32 ) /E ( " 1 = ( 88 ) /E ( 79 ) ) /C
  ` | ` q 1 + q !
  b q ? " 0 = ( 32 ) /E ( " 1 = ( 88 ) /E ( 79 ) ) /C
  /N
  q 3 + q !
;

:D
  `  1   2   3` /N
  0 q !
  `A ` R
  L
  `B ` R
  L
  `C ` R
;













```
