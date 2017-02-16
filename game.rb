class Board
	def initiate
	@board
	end
	def create_board
		@board = [[:a1,"|",:a2,"|",:a3],[:b1,"|",:b2,"|",:b3],[:c1,"|",:c2,"|",:c3]]
	end	
	def draw_board
		for i in @board
			print "\n" + i.join(" ") + "\n"
		end
	end		
end

class Player
	def initiate(name)
		@name = name
	end
end
	


	test = Board.new
	test.create_board
	test.draw_board