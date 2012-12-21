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



# board[0][0] = player1
# board[1][2] = player2
# board[0][1] = player1
# board[0][2] = player1


initial_board

puts "Player 1, please choose a numbered space to occupy"
choice = gets.chomp
board[0].index(1) == choice
show_board(board)




# win conditions
# ex
# if board[0] = ["X","X","X"]
# 	puts "player 1 wins"
# end



# if column1 || column2 || column3 || board[0] || board[1] || board[2] == player1_wins || player2_wins
#   puts "someone won"
# end

# puts column1.join("|")
# puts column2.join("|")
# puts column3.join("|")

# choose size of tictactoe -- length * width is chosen (not just 3 * 3)
