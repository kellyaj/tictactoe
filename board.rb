player1 = "X"
player2 = "O"

board = [
	["1", "2", "3"], 
	["4", "5", "6"], 
	["7", "8", "9"] 
]


# need a way to express the columns and diagonals
@winner_array = [true, true, true]

# checks to see if a player has won through row occupation
def win_condition_row(board,current_player)
  board.each do |board|
    if board.collect { |w| w == current_player} == @winner_array
      @winner = true
    end
  end
end

# checks to see if a player has won through column occupation. unfortunately messy
def win_condition_column(board,current_player)
  column1 = []
  column2 = []
  column3 = []
  columns = [column1, column2, column3]
  board.each do |board|
    column1 << board.first
    column2 << board[1]
    column3 << board.last
  end
  columns.each do |column|
    if column.collect { |w| w == current_player} == @winner_array
      @winner = true
    end
  end
end

def win_condition_diagonal(board,current_player)
  diagonal1 = []
  diagonal2 = []
  diagonals = [diagonal1, diagonal2]
  diagonal1 << board[0][0] << board[1][1] << board[2][2]
  diagonal2 << board[0][2] << board[1][1] << board[2][0]
  diagonals.each do |diagonal|
    if diagonal.collect { |w| w == current_player} == @winner_array
      @winner = true
    end
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

# validation that a space is not taken already
def occupied_check(board,pos)
  row = (pos - 1) / 3
  column = (pos - 1) % 3
  if board[row][column] == "X" || board[row][column] == "O"
    @valid_move = false
    puts "choose again, that place is occupied"
  else
    @valid_move = true
  end
end

# initialization stuff
@winner = false
show_board(board)
@current_player = player2 # unfortunate artifact of hackish player cycling

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
  win_condition_row(board,@current_player)
  win_condition_column(board,@current_player)
  win_condition_diagonal(board,@current_player)
  if @winner == true
    puts "#{@current_player} has won the game."
  end
end



# choose size of tictactoe -- length * width is chosen (not just 3 * 3)
