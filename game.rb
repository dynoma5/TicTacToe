class Board
attr_accessor :board
	
	
	def create_board
		@board = [[:a1,"|",:a2,"|",:a3],[:b1,"|",:b2,"|",:b3],[:c1,"|",:c2,"|",:c3]]
	end	
	def draw_board
		for i in @board
			print "\n" + "\t" + i.join(" ") + "\n"
		end
		print "\n"
	end		
	
	def mark_board(location)
		for i in (0..2)
			for j in (0..4)
				if @board[i][j] == location
					result = yield
					@board[i][j] = result
				end
				
			end	
		end	
		return @board
	end
	
	def test_board
	check = false
		if (@board[0][0] == @board[0][2]) and (@board[0][0] == @board[0][4])
			check = true
		elsif (@board[1][0] == @board[1][2]) and (@board[1][0] == @board[1][4])
			check = true
		elsif (@board[2][0] == @board[2][2]) and (@board[2][0] == @board[2][4])
			check = true
		elsif (@board[0][0] == @board[1][0]) and (@board[0][0] == @board[2][0])
			check = true
		elsif (@board[0][2] == @board[1][2]) and (@board[0][2] == @board[2][2])
			check = true
		elsif (@board[0][4] == @board[1][4]) and (@board[0][4] == @board[2][4])
			check = true
		elsif (@board[0][0] == @board[1][2]) and (@board[0][0] == @board[2][4])
			check = true
		elsif (@board[0][4] == @board[1][2]) and (@board[0][4] == @board[2][0])
			check = true
		else
			check = false
		end
		return check
	end	
	def tie_condition
		check = true
		for i in (0..2)
			for j in (0..4)
				if @board[i][j].class == Symbol
					check = false
					break
				end
			end
			if check == false
				break
			end
		end
		return check
	end
	
end

class Player
attr_accessor :name, :mark
	def initialize(name, mark)
		@mark = mark
		@name = name
	end
	
end
	def start_game
		win_condition = false
		board = Board.new
		board.create_board
		puts "Time to play some tic-tac-toe! Player 1 is X and Player 2 is O. \n\nPlease enter Player 1's name."
		name = gets.chomp
		player1 = Player.new(name, "X ")
		puts "\nPlease enter Player 2's name."
		name = gets.chomp
		player2 = Player.new(name, "O ")
		while win_condition == false do
			puts "\n#{player1.name}: Please type in where you'd like to mark:"
			board.draw_board
			location = gets.chomp.to_sym
			board.mark_board(location) do |x| 
				x = player1.mark
			end
			 
			if board.test_board == true
				board.draw_board
				puts "#{player1.name} win!"
				win_condition = true
				break
			elsif board.tie_condition == true
				board.draw_board
				puts "It's a tie! Game Over~!"
				win_condition = true
				break
			end
			puts "\n#{player2.name}: Please type in where you'd like to mark:"
			board.draw_board
			location = gets.chomp.to_sym
			board.mark_board(location) do |x| 
				x = player2.mark
			end
			if board.test_board == true
				board.draw_board
				puts "#{player2.name} win!"
				win_condition = true
				break
			elsif board.tie_condition == true
				board.draw_board
				puts "It's a tie! Game Over~!"
				win_condition = true
				break
			end
		end
	end	
			
			
start_game