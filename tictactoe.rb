game_board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
counter = 0

def print_game_board(game_board)
  puts game_board[0].join(" | ")
  puts "---------"
  puts game_board[1].join(" | ")
  puts "---------"
  puts game_board[2].join(" | ")
end

def evaluate_game(game_board)
  game_finished = false
  for i in 0..2
    if (game_board[i][0] == game_board[i][1]) && (game_board[i][1]==game_board[i][2]) #rows
      puts "User " + game_board[i][1].to_s + " wins"
      game_finished = true
      break
      elsif  (game_board[0][i] == game_board[1][i]) && (game_board[0][i] == game_board[2][i]) #columns
        puts "User " + game_board[0][i].to_s + " wins"
        game_finished = true
        break
    end
  end
  
  #Diagonals
  if (game_board[0][0]==game_board[1][1]) && (game_board[0][0] == game_board[2][2])
    puts "User " + game_board[0][0].to_s + " wins"
    game_finished = true
    elsif (game_board[2][0]==game_board[1][1]) && (game_board[2][0] == game_board[0][2])
    puts "User " + game_board[2][0].to_s + " wins"
    game_finished = true
  end
  
  return game_finished
  
end

#Initial statements
user_turn = 'X'
print_game_board(game_board)

loop do
  
  if (counter == 8)
    puts "Game Over! No player won"
    break
  end
  
  puts "Your turn player " + user_turn
    
    puts "Select a slot"
    slot = gets.chomp!.to_i
    possibilities = [1,2,3,4,5,6,7,8,9]
    include_bool = possibilities.include?slot
    
    if (include_bool == false)
      puts "Invalid. Enter an available number between 1-9"
      next
    end
    
    #Column
    if (slot%3 == 2)
    column = 1
      elsif
        (slot%3 == 1)
          column = 0
          elsif (slot%3 == 0)
            column = 2
    end
    #Row
    if (slot-1)/3 == 0
      row = 0
      elsif (slot-1)/3 == 1
        row = 1
        elsif (slot-1)/3 == 2
          row = 2
    end
  
  # If selected slot taken already
  if (game_board[row][column] != 'X') && (game_board[row][column] != 'O')
    game_board[row][column] = user_turn
    print_game_board(game_board)
  else
      puts 'That slot is taken! Pick another'
      next
  end
  
  
  
  # Evaluate if there's a winner
  is_game_finished = evaluate_game(game_board)
  if is_game_finished == true
    puts 'Game over!'
    break
  end
  
  #Change the player
  if user_turn == 'X'
    user_turn = 'O'
      else user_turn = 'X'
  end
  
counter += 1

end
