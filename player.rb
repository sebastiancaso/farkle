class Player

	attr_accessor :points

	def initialize
		@points = 0 
	end 

	def update_points(points)
		self.points += points
	end 

	def show_score
		self.points
	end 

end 


