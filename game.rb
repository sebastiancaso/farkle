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

	def select_dice(roll)
		p "You scored a total of #{calculate_score(roll)} points on that roll.  Which dice would you like to select?"
		p "#-----------------------------------------------#"
	
		gets.chomp		
	end 

	#updates the players points/dice
	def in_turn_update(player, player_selection)
		dice.set_aside_dice(player_selection)
		player.turn_points += calculate_score(player_selection) 
		p "your turn score is #{player.turn_points}"
			
	end 
	
	#determines if a player has a winning score
	def winning_score(player)
		if player.points > 10000
			self.victory = true 
			puts "Congratualtions you won!"
		else
			self.victory = false
		end 
	end 

	def clear_farkle_cup
		self.dice.farkle_cup.clear
	end 

	#determines if no points were scored on a roll
	def farkle(points_scored)
		if calculate_score(points_scored) == 0
			puts "Farkle!!!!!  You did not score!"
			p "#-----------------------------------------------#"
			return true
		end  
	end 

	
	#contains most of game logic
	def turn(current_player)  
		p "#---------------------------------------------New Turn---------------------------------------------#"
		end_turn = nil
		total_dice = 6 
		farkle = false
		 
		until end_turn == 'p' 
			
			#displays roll and populates farkle_cup with dice
			p roll = dice.roll_dice(total_dice) 
			p "You have #{current_player.show_score} points for the game."	
					
			#if 0 is returned set farkle to true
			if farkle(roll) == true 
				clear_farkle_cup
				current_player.turn_points = 0 
				end_turn = 'p'
			else #player chooses dice and turn_score is updated
				selection = select_dice(roll)
				in_turn_update(current_player, selection)
				
				total_dice = total_dice - selection.length

				if dice.hot_dice? 
					puts "#HOT DICE!!! YOU GET 6 MORE DICE TO THROW!"
					self.turn(current_player)
					break
				end  
					
				p "Would you like to roll again or end your turn? ('p' to end turn/ 'r' to roll again)"
				end_turn = gets.chomp
				
				clear_farkle_cup 
								
				current_player.update_game_points if end_turn == 'p'				
			end 
		end				
	end 

	def play		
        # Iterates through all the players until a winning score is detected
        until self.victory == true
        	self.players.each do |current_player| 
        	  turn(current_player)
        	  winning_score(current_player) 
      		end
      	end 		
	end 
end 


puts "How many people are playing?"
	answer = gets.chomp
	game = Game.new
	game.set_num_of_players(answer.to_i)
	game.play



