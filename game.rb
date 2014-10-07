require_relative 'die'
require_relative 'scoring'
require_relative 'player'

class Game 
	include Scoring
	attr_reader :players
	attr_accessor :dice, :victory

	def initialize
		@players = []
		@dice = Die.new
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
		if calculate_score(points_scored) == 0
			puts "Farkle!!!!!  You did not score!"
			p "#-----------------------------------------------#"
			return true
		end  
	end 

	def turn(current_player)  #set up farkle scenario
		p "#---------------------------------------------New Turn---------------------------------------------#"
		end_turn = nil
		total_dice = 6 
		farkle = false
		 
		until end_turn == 'p' 
			#displays roll and populates farkle_cup with dice
			p roll = dice.roll_dice(total_dice) 
			p "You have #{current_player.show_score} points for the game."	
			
			#break if statement into its own method into
			#if 0 is returned set farkel to true
			if farkle(roll) == true #count roll info in calculate
				self.dice.farkle_cup.clear
				current_player.turn_points = 0 
				end_turn = 'p'
				#break else into its own method
			else
				p "You scored a total of #{calculate_score(roll)} points on that roll.  Which dice would you like to select?"
				p "#-----------------------------------------------#"

				selection = gets.chomp
				dice.set_aside_dice(selection)
				
				current_player.turn_points += calculate_score(selection) #calc bank in calculate score

				p "your temp score is #{current_player.turn_points}"
				total_dice = total_dice - selection.length	
					if dice.hot_dice? #break if into its own method
						puts "#HOT DICE!!! YOU GET 6 MORE DICE TO THROW!"
						self.turn(current_player)
					end  
					#make into roll_again method
				p "Would you like to roll again or end your turn? ('p' to end turn/ 'r' to roll again)"
				self.dice.farkle_cup.clear
				end_turn = gets.chomp
				
					if end_turn == 'p'
						current_player.update_game_points
					end 
			end 
		end		
		#remove number of dice for next role (unless all 6 score)
	end 

	def play
		
        # iterate through all the players
        until self.victory == true
        	self.players.each do |current_player| 
        	  turn(current_player)
        	  winning_score(current_player) 
      		end
      	end 
		
	end 
end 

#TODO
#need to deal with recursive problem on hotdice turn.
#break up turn method into smaller methods (generally methods should not be larger than 10 lines)
puts "How many people are playing?"
	answer = gets.chomp
	game = Game.new
	game.set_num_of_players(answer.to_i)
	game.play



