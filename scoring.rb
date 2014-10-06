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

	def calc_banked(dice)
		count = Hash.new 0
		dice.each_char do |die|
			count[die.to_i] += 1
		end 
		return count
	end 
	
	#four 1s is registering as 1000 when it should be 1100
	def calculate_score(count)
		points = []
		2.times do 
			count.each do |key, value|
				if value == 3 && key == 1 
					points << 1000
					count.delete(key)
				elsif value == 6
					points << 3000   
					count.delete(key)
				elsif value == 5
					points << 2000   
					count.delete(key)
				elsif value == 4
					points << 1000   
					count.delete(key)
				elsif value == 3 
					points << key * 100
					count.delete(key)
				elsif key == 1
					points << 100 * value
					count.delete(key)
				elsif key == 5
					points << 50 * value
					count.delete(key)
				else
					nil
				end
			end 
		end 
		 return points.inject{|element, sum| sum + element}
	end
end




