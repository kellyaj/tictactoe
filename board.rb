player1 = "X"
player2 = "O"

board = [
	["1", "2", "3"], 
	["4", "5", "6"], 
	["7", "8", "9"] 
]


# need a way to express the columns and diagonals
@winner_array = [true, true, true]

def win_condition_row(board,current_player)
  board.each do |board|
    if board.collect { |w| w == current_player} == @winner_array
      @winner = true
    end
  end
end

def win_condition_column(board,current_player)

end

def initial_board
	board = [
	[1, 2, 3], 
	[4, 5, 6], 
	[7, 8, 9]
	]

	puts board[0].join(" __|__ ")
	puts board[1].join(" __|__ ")
	puts board[2].join("   |   ")
end

# shows the board in its current state
def show_board(board)
  puts board[0].join(" __|__ ")
  puts board[1].join(" __|__ ")
  puts board[2].join("   |   ")
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




# the game loop, will continue until win condition is met
@winner = false
initial_board
@current_player = player2
while @winner == false
  cycle_players(@current_player)
  puts " #{@current_player}, please choose a numbered space to occupy"
  choice = gets.chomp
  place_player_mark(board,choice.to_i,@current_player)
  show_board(board)
  win_condition_row(board,@current_player)
  win_condition_column(board,@current_player)
  if @winner == true
    puts "#{@current_player} has won the game."
  end
end



# choose size of tictactoe -- length * width is chosen (not just 3 * 3)
