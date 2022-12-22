      board ← 3 3 ⍴ ' '
      winning_combinations ← 8 3 ⍴ 0 0, 0 1, 0 2, 1 0, 1 1, 1 2, 2 0, 2 1, 2 2, 0 0, 1 0, 2 0, 0 1, 1 1, 2 1, 0 2, 1 2, 2 2, 0 0, 1 1, 2 2, 2 0, 1 1, 0 2
      human_player ← 'X'
      computer_player ← 'O'
      current_player ← human_player
      :While 1
        ⎕ ← board
        row ← ⎕
        col ← ⎕
        If row ≥ 0 ∧ row ≤ 2 ∧ col ≥ 0 ∧ col ≤ 2 ∧ board[row;col] = ' '
          board[row;col] ← current_player
          win_result ← check_win(board, winning_combinations)
          If win_result = human_player
            ⎕ ← "Human player wins!"
            break
          ElseIf win_result = computer_player
            ⎕ ← "Computer player wins!"
            break
          ElseIf win_result = 'T'
            ⎕ ← "It's a draw!"
            break
          Else
            If current_player = human_player
              current_player ← computer_player
              computer_row, computer_col ← generate_computer_move(board)
              board[computer_row;computer_col] ← current_player
            Else
              current_player ← human_player
            End
          End
        Else
          ⎕ ← "Invalid move, try again"
        End
      End

check_win ← {board winning_combinations}
  :For combination ∊ winning_combinations
    If board[combination[1];combination[2]] = board[combination[1];combination[2]] = board[combination[3];combination[4]]
