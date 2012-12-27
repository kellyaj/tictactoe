player1 = "X"
player2 = "O"

board = [
	["1", "2", "3"], 
	["4", "5", "6"], 
	["7", "8", "9"] 
]

# checks to see if a player has won through row occupation
def win_condition_row(board,current_player)
  board.each do |board|
    if board.all? { |w| w == current_player} 
      @winner = true
    end
  end
end

# checks to see if a player has won through column occupation.
def win_condition_column(board,current_player)
  columns = board.transpose
  columns.each do |column|
    if column.all? { |w| w == current_player}
      @winner = true
    end
  end
end

# checks to see if a player has won through diagonal occupation. unfortunately split up
def win_condition_diagonal_ltr(board,current_player)
  for i in (0..2) do
    return false if board[i][i] != current_player
  end
  return @winner = true
end

def win_condition_diagonal_rtl(board,current_player)
  for i in (0..2) do
    return false if board[i][-(i+1)] != current_player
  end
  return @winner = true
end

# checks to see if the game has ended in a stalemate. unfortunately force entire board to be full
def stalemate_check(board)
  taken_places = board.flatten
  taken_places.collect! {|y| y.to_i}
  if taken_places.inject(:+) == 0
    @stalemate = true
  end
end

# checks to see if the game is over through win conditions or stalemate
def game_over_check(board,current_player)
  win_condition_row(board,@current_player)
  win_condition_column(board,@current_player)
  win_condition_diagonal_ltr(board,@current_player)
  win_condition_diagonal_rtl(board,@current_player)
  stalemate_check(board)

  if @winner == true
    puts "#{@current_player} has won the game."
  end
  if @stalemate == true
    puts "The game ended in a stalemate."
    @winner = true
  end
end

# shows the board in its current state
def show_board(board)
  puts "    " + board[0].join("   |   ")
  puts "   " + "-------------------"
  puts "    " + board[1].join("   |   ")
  puts "   " + "-------------------"
  puts "    " + board[2].join("   |   ")
end


# converts user input into an actual index
# ex. 6 --> board[1][2]
def place_player_mark(board,pos,player)
  row = (pos - 1) / 3
  column = (pos - 1) % 3
  board[row][column] = player
end


#changes the player. primitive and messy
def cycle_players(current_player)
  player1 = "X"
  player2 = "O"
  if @current_player == player1
    @current_player = player2
  else
    @current_player = player1
  end
  return @current_player
end

# validates choice is possible and that a space is not taken already
def occupied_check(board,pos)
  possible_choices = board.flatten
  if possible_choices.include?(pos.to_s) == true
    row = (pos - 1) / 3
    column = (pos - 1) % 3
    if board[row][column] == "X" || board[row][column] == "O"
      @valid_move = false
      puts "choose again, that place is occupied"
    else
      @valid_move = true
    end
  else
    @valid_move = false
    puts "That is not a valid choice, try again"
  end
end


# initialization stuff
@winner = false
show_board(board)
@current_player = player2 # unfortunate artifact of hackish player cycling
@stalemate = false

# the game loop, will continue until win condition is met
while @winner == false
  cycle_players(@current_player)
  puts " #{@current_player}, please choose a numbered space to occupy"

  # player input and move validation 
  @valid_move = false
  while @valid_move == false
    choice = gets.chomp
    occupied_check(board,choice.to_i)
  end

  # placing of player mark, assuming its valid
  place_player_mark(board,choice.to_i,@current_player)
  show_board(board)

  # checking if game is over
  game_over_check(board,@current_player)
end

# additional cleaning to be done:
# fix the cycling of players
# merge diagonal win check?
# 

# more stuff for later:
# separation
#    initializers, board, players, win conditions, game itself
# choose size of tictactoe -- length * width is chosen (not just 3 * 3)
# stalemate detection, instead of forcing all locations to be occupied
# computer AI
