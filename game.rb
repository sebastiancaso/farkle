require_relative 'roll'
require_relative 'scoring'
require_relative 'player'

class Game 
	include Scoring
	attr_reader :players
	attr_accessor :roll, :victory

	def initialize
		@players = []
		@roll = Roll.new
		@victory = false
	end 

	def set_num_of_players(number)
		number.times do 
			self.players <<	Player.new
		end 
	end

	def winning_score(player)
		if player.points > 10000
			self.victory = true 
			puts "Congratualtions you won!"
		else
			self.victory = false
		end 
	end 

	def farkle(points_scored)
		if points_scored == nil
			puts "Farkle!!!!!  You did not score!"
			p "#-----------------------------------------------#"
			return true
		end  
	end 

	def turn(current_player)  #set up farkle scenario
		p "#---------------------------------------------New Turn---------------------------------------------#"
		#to take care of loss of points on farkle create a turn array that will be used to subtract points
		temp_score = 0
		end_turn = nil
		total_dice = 6 
		farkle = false
		until end_turn == 'p' #set hot dice here
			#displays roll and populates farkle_cup with dice
			p roll.roll_dice(total_dice) 
			p "You have #{current_player.show_score} points for the game."	
			if farkle(calculate_score(roll.count_roll)) == true
				self.roll.farkle_cup.clear
				end_turn = 'p'
			else
				p "You scored a total of #{calculate_score(roll.count_roll)} points on that roll.  Which dice would you like to select?"
				p "#-----------------------------------------------#"
				selection = gets.chomp 		
				#select dice to bank 
				turn_score = calculate_score(calc_banked(selection))
				temp_score += turn_score
				p "your temp score is #{temp_score}"
				roll.set_aside_dice(selection)
				total_dice = total_dice - selection.length	
				p "Would you like to roll again or end your turn? ('p' to end turn/ 'r' to roll again)"
				self.roll.farkle_cup.clear
				end_turn = gets.chomp
					if end_turn == 'p'
						current_player.update_points(turn_score)
					end 
			end 
		end		
		#remove number of dice for next role (unless all 6 score)
	end 

	def play
		
        # iterate through all the players
        until self.victory == true
        	self.players.each do |current_player| #create a loop until game is won
        	  turn(current_player)
        	  winning_score(current_player) 
      		end
      	end 
		
	end 
end 

#need to add hot dice logic + clear turn points on Farkle
puts "How many people are playing?"
	answer = gets.chomp
	game = Game.new
	game.set_num_of_players(answer.to_i)
	game.play



