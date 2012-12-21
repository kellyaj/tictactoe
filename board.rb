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

  # 1-3 = board[0]
  # 4-6 = board[1]
  # 7-9 = board[2]
  # column 1 = board[0][0] && board[1][0] && board[2][0]
end

initial_board
current_player = player1
puts "Player 1 please choose a numbered space to occupy"
choice = gets.chomp
place_player_mark(board,choice.to_i,current_player)
show_board(board)
current_player = player2
puts "Player 2 please choose a numbered space to occupy"
choice = gets.chomp
place_player_mark(board,choice.to_i,current_player)
show_board(board)



# win conditions
# ex
# if board[0] = ["X","X","X"]
# 	puts "player 1 wins"
# end


# while loop until win condition is met
# if space is occupied prevent marking


# if column1 || column2 || column3 || board[0] || board[1] || board[2] == player1_wins || player2_wins
#   puts "someone won"
# end

# puts column1.join("|")
# puts column2.join("|")
# puts column3.join("|")

# choose size of tictactoe -- length * width is chosen (not just 3 * 3)
