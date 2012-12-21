player1 = "X"
player2 = "O"

board = [
	["1", "2", "3"], 
	["4", "5", "6"], 
	["7", "8", "9"] 
]

column1 = []
column2 = []
column3 = []

board.each do |z|
  column1 << z[0]
  column2 << z[1]
  column3 << z[2]
end

win_conditions = [ board[0], board[1], board[2], column1, column2, column3, [1,5,9], [7,5,3] ]
player1_wins = ["X", "X", "X"]
player2_wins = ["O", "O", "O"]

winner = false



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

initial_board
# current_player = player1
# puts "Player 1 please choose a numbered space to occupy"
# choice = gets.chomp
# place_player_mark(board,choice.to_i,current_player)
# show_board(board)
# current_player = player2
# puts "Player 2 please choose a numbered space to occupy"
# choice = gets.chomp
# place_player_mark(board,choice.to_i,current_player)
# show_board(board)

while winner == false
  current_player = player1
  puts "Please choose a numbered space to occupy"
  choice = gets.chomp
  place_player_mark(board,choice.to_i,current_player)
  show_board(board)
  if win_conditions.include? player1_wins || player2_wins
      winner = true
      puts "The game is over"
  end
end


# while loop until win condition is met
# if space is occupied prevent marking



# choose size of tictactoe -- length * width is chosen (not just 3 * 3)
