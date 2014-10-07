# Dice combination	Score
# Each 1			100
# Each 5			50
# Three 1s			1000
# Three 2s			200
# Three 3s			300
# Three 4s			400
# Three 5s			500
# Three 6s			600
#Four of a kind 	1000
#Five of a kind		2000
#Six of a kind 		3000

module Scoring

	def bank_dice(dice) #change name to set aside?
		count = Hash.new 0
		if dice.is_a? String
			dice.each_char do |die|
				count[die.to_i] += 1
			end 
		else
			dice.each do |die|
				count[die.to_i] += 1
			end 
	    end 
		return count 
	end 
	
	#four 1s is registering as 1000 when it should be 1100
	def calculate_score(removed_dice)
		banked_dice = bank_dice(removed_dice)
		points = 0 
			banked_dice.each do |key, value|
				if value == 3 && key == 1 
					points += 1000
				elsif value == 6
					points += 3000   
				elsif value == 5
					points += 2000   
					
				elsif value == 4
					points += 1000   
					
				elsif value == 3 
					points += key * 100
					
				elsif key == 1
					points += 100 * value
					
				elsif key == 5
					points += 50 * value
					
				else
					nil
				end
		end 
		 return points
	end
end


