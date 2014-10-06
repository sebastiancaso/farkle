class Player

	attr_accessor :points, :turn_points

	def initialize
		@points = 0 
		@turn_points = 0
	end 

	def update_points(points)
		self.points += points
	end 

	def show_score
		self.points
	end 

	def update_game_points
		self.update_points(self.turn_points)
		self.turn_points = 0
	end 

end 


