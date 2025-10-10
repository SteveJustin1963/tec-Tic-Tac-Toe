<img width="666" height="666" alt="image" src="https://github.com/user-attachments/assets/fcaad56e-aa2e-44db-a753-b2fce8c5b44f" />

 
  ```
:B [1 2 3 4 5 6 7 8 9] b! ;
:D 3( 3( b /j 3 * /i + ? . ` ` ) /N ) ;
```

```
:B [0 0 0 0 0 0 0 0 0] b! ;
:D 3( 3( b /j 3 * /i + ? . ` ` ) /N ) ;
:M p! m! p b m 1 - ?! ;
:C 9( /i 1 + . `: ` b /i ? 0 >(`occupied`)/E(`empty`) /N ) ;
```

```
:B [0 0 0 0 0 0 0 0 0] b! ;
:D 3( 3( b /j 3 * /i + ? . ` ` ) /N ) ;
:M p! m! b m 1 - ? 0 >(`occupied try again` /N)/E(p b m 1 - ?!) ;
```

```
:B [0 0 0 0 0 0 0 0 0] b! ;
:D 3( 3( b /j 3 * /i + ? . ` ` ) /N ) ;
:M p! m! b m 1 - ? 0 >(`occupied try again` /N)/E(p b m 1 - ?!) ;
:W /F w! 3( /i 3 * r! b r ? b r 1 + ? = b r 1 + ? b r 2 + ? = & b r ? 0 > & ( /T w! ) ) 3( b /i ? b /i 3 + ? = b /i 3 + ? b /i 6 + ? = & b /i ? 0 > & ( /T w! ) ) b 0 ? b 4 ? = b 4 ? b 8 ? = & b 0 ? 0 > & ( /T w! ) b 2 ? b 4 ? = b 4 ? b 6 ? = & b 2 ? 0 > & ( /T w! ) w (`won` /N)/E(`no winner` /N) ;
```


// shorter W
```
:B [0 0 0 0 0 0 0 0 0] b! ;
:D 3( 3( b /j 3 * /i + ? . ` ` ) /N ) ;
:M p! m! b m 1 - ? 0 >(`occupied try again` /N)/E(p b m 1 - ?!) ;
:W [0 1 2 3 4 5 6 7 8 0 3 6 1 4 7 2 5 8 0 4 8 2 4 6] w! /F r! 8( w /i 3 * ? p! w /i 3 * 1 + ? q! w /i 3 * 2 + ? s! b p ? b q ? = b q ? b s ? = & b p ? 0 > & ( /T r! ) ) r (`won` /N)/E(`no winner` /N) ;
```
