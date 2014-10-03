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

	def turn(current_player)  #set up farkle scenario
		end_turn = nil
		total_dice = 6 
		until end_turn == 'p' 
			#displays roll and populates farkle_cup with dice
			p roll.roll_dice(total_dice) 
			p "You have #{current_player.show_score} points for the game."
			p "#-----------------------------------------------#"
			p "You scored a total of #{calculate_score(roll.count_roll)} points on that roll.  Which dice would you like to select?"
			selection = gets.chomp 		
			
			#select dice to bank 
			turn_score = calculate_score(calc_banked(selection))
			current_player.update_points(turn_score)
			roll.set_aside_dice(selection)
			total_dice = total_dice - selection.length	
			p "Would you like to roll again or end your turn? ('p' to end turn/ 'r' to roll again)"
			p self.roll.farkle_cup.clear
			end_turn = gets.chomp
		end		
		#remove number of dice for next role (unless all 6 score)
	end 

	def play
		#use .cycle to run turn for each player
        # iterate through all the players
        until self.victory == true
        	self.players.each do |current_player| #create a loop until game is won
        	  turn(current_player)
        	  winning_score(current_player) 
      		end
      	end 
		#set player in this loop before calling turn
	end 
end 


puts "How many people are playing?"
	answer = gets.chomp
	game = Game.new
	game.set_num_of_players(answer.to_i)
	game.play



