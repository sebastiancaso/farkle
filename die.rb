require_relative 'scoring'

class Die
	include Scoring
	attr_reader :farkle_cup, :total_dice 

	def initialize 
		@farkle_cup = [] 
		@total_dice = 6
	end 
		
	def roll_dice(total_dice)
		(total_dice).times do 
			@farkle_cup << rand(6) + 1
		end 
		@farkle_cup
	end 
 
	def set_aside_dice(dice_to_remove)
		dice_to_remove.each_char do |char|
			@farkle_cup.delete_at(@farkle_cup.index(char.to_i) || @farkle_cup.length)
		end
	end 

	def hot_dice?
		if self.farkle_cup.length == 0 	
			return true 
		else 
			return false 
		end 
	end 

	def update_dice(selection)
		self.set_aside_dice(selection)
		self.total_dice = self.total_dice - selection.length
	end
end 

