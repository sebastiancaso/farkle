# Dice combination	Score
# Each 1			100
# Each 5			50
# Three 1s			1000
# Three 2s			200
# Three 3s			300
# Three 4s			400
# Three 5s			500
# Three 6s			600

class Die
	attr_reader :sides
	
	def initialize 
		@sides = rand(1..6)
	end 
end 

farkle_cup = []

#puts dice in farkle cup
6.times do 
	farkle_cup << Die.new
end 

count = Hash.new 0 

farkle_cup.each do |die|
  count[die.sides] += 1
end
score_pad = []

def calculate_score(count)
	points = []
	2.times do 
		count.each do |key, value|
			if value >= 3 && key == 1 
				points << 1000
				 count[key] = value - 3 
			elsif value >= 3 && key == 5 
				points << 500
				 count[key] = value - 3 
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
	 p points
	 p count
end 



# p count.size
# p "--------


calculate_score(count)

# p count

