require_relative 'scoring'

class Roll
	include Scoring 
	attr_reader :farkle_cup, :board

	def initialize 
		@farkle_cup = [] 
	end 
		
	def roll_dice(total_dice)
		(total_dice).times do 
			@farkle_cup << rand(6) + 1
		end 
		@farkle_cup
	end 

	
	def count_roll	
		count = Hash.new 0
		@farkle_cup.each do |die|
		  count[die] += 1
		end
		count
	end 

	def set_aside_dice(dice_to_remove)
		dice_to_remove.each_char do |char|
		@farkle_cup.delete_at(@farkle_cup.index(char.to_i) || @farkle_cup.length)
		end
	end 

end 

