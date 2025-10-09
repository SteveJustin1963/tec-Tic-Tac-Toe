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

