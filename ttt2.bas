
    dim grid(3,3)

sub print_grid()
    dim i, j
    for i = 0 to 2
        for j = 0 to 2
            print grid(i,j); " ";
        next j
        print
    next i
end sub
    
sub clear_grid()
    dim i, j
    for i = 0 to 2
        for j = 0 to 2
            grid(i,j) = " ";
        next j
    next i
end sub
    
function check_win()
    dim i, j
    dim win
    win = 0
    for i = 0 to 2
        if grid(i,0) <> " " and grid(i,0) = grid(i,1) and grid(i,1) = grid(i,2) then
            win = 1
        end if
        if grid(0,i) <> " " and grid(0,i) = grid(1,i) and grid(1,i) = grid(2,i) then
            win = 1
        end if
    next i
    if grid(0,0) <> " " and grid(0,0) = grid(1,1) and grid(1,1) = grid(2,2) then
        win = 1
    end if
    if grid(0,2) <> " " and grid(0,2) = grid(1,1) and grid(1,1) = grid(2,0) then
        win = 1
    end if
    check_win = win
end function
    
function check_draw()
    dim i, j
    dim draw
    draw = 1
    for i = 0 to 2
        for j = 0 to 2
            if grid(i,j) = " " then
                draw = 0
            end if
        next j
    next i
    check_draw = draw
end function

    dim player
    dim row, col
    dim win
    dim draw
    
    call clear_grid
    player = 1
    win = 0
    draw = 0
    while win = 0 and draw = 0
        call print_grid
        print "Player "; player; ", enter row and column: ";
        input row, col
        if grid(row,col) = " " then
            if player = 1 then
                grid(row,col) = "X"
            else
                grid(row,col) = "O"
            end if
            win = check_win()
            draw = check_draw()
            if player = 1 then
                player = 2
            else
                player = 1
            end if
        else
            print "That space is already taken."
        end if
    wend
    call print_grid
    if win = 1 then
        print "Player "; player; " wins!"
    else
        print "Draw!"
    end if

 
