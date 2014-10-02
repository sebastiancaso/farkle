
#Game Rules 

#a user has 6 dice to roll
#a user cannot keep any points until he hits 500 points
#a user can decide to continue for more points or store their points at 500 
#any dice that score points must be removed 
#if all six dice are used to score points a user gets gets six dice to continue to score points 
#if you score no points on a turn you have farkled which ends your turn, the user loses all points scored during that turn
#the first to reach 10,000 points initiates the end game sequence, the remaining players each get a turn
#the player with the highest point total wins the game 


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
board = []
score_pad = []
#puts the dice roll in an array to be manipulated later

# farkle_cup.each do |roll|
# 	board << roll.sides
# end 

board = [1,1,1]

until board.length == 0 
	case
	when board.count(1) == 3
		score_pad << 1000
		board.delete(1)
		#arrange board and pop three ones off instead of delete
	when board.count(2) == 3 
		score_pad << 200
		board.delete(2)
	when board.count(3) == 3 
		score_pad << 300
		board.delete(3)
	when board.count(4) == 3 
		score_pad << 400
		board.delete(4)
	when board.count(5) == 3 
		score_pad << 500
		board.delete(5)
	when board.count(6) == 3 
		score_pad << 600
		board.delete(6)
	when board.count(1) < 3
		score_pad << 100 * board.count(1)
		board.delete(1) 
	end
end

p board
p "-----------------------"
p score_pad

		



#use this page to count occurences (http://blog.jerodsanto.net/2013/10/ruby-quick-tip-easily-count-occurrences-of-array-elements/)
# Dice combination	Score
# Each 1			100
# Each 5			50
# Three 1s			1000
# Three 2s			200
# Three 3s			300
# Three 4s			400
# Three 5s			500
# Three 6s			600

















