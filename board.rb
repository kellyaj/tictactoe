
board = [
	[1, 2, 3], 
	[4, 5, 6], 
	[7, 8, 9]
]


def show_board
	board = [
	[1, 2, 3], 
	[4, 5, 6], 
	[7, 8, 9]
	]

	puts board[0].join(" __|__ ")
	puts board[1].join(" __|__ ")
	puts board[2].join("   |   ")
end

player1 = "X"
player2 = "O"

# board[0][0] = player1
# board[1][2] = player2
# board[0][1] = player1
# board[0][2] = player1



show_board


column1 = []
column2 = []
column3 = []

board.each do |z|
	column1 << z[0]
	column2 << z[1]
	column3 << z[2]
end

# win conditions
# ex
# if board[0] = ["X","X","X"]
# 	puts "player 1 wins"
# end
player1_wins = ["X", "X", "X"]
player2_wins = ["O", "O", "O"]


# puts column1.join("|")
# puts column2.join("|")
# puts column3.join("|")

# choose size of tictactoe -- length * width is chosen (not just 3 * 3)
