require_relative 'die'
require_relative 'roll'
require_relative 'scoring'
require_relative 'player'

class Game 
	include Scoring
	attr_reader :players
	attr_accessor :roll

	def initialize
		@players = []
		@roll = Roll.new
	end 

	def set_num_of_players(number)
		number.times do 
			self.players <<	Player.new
		end 
	end

	def victory?(current_player)
		if current_player.points >=  10000
			return true 
		end
	end 

	def turn(current_player)  #set up farkle scenario
		end_turn = nil
		total_dice = 6 
		until end_turn == 'p'
		roll.roll_dice(total_dice)
		#roll dice 
		#display roll 
		p roll.show_roll
		roll.board.clear
		#show total number of points scored with roll
		p "You point total is #{current_player.show_score}"
		p "!-------------!"
		p "You scored a total of #{calculate_score(roll.count_roll)} points on that roll.  Which dice would you like to select?"
		selection = gets.chomp 		
		
		#select dice to bank 
		turn_score = calculate_score(calc_banked(selection))
		current_player.update_points(turn_score)
		roll.set_aside_dice(selection)
		total_dice = total_dice - selection.length	
		p "Would you like to roll again or end your turn? ('p' to end turn/ 'r' to roll again)"
		end_turn = gets.chomp
		end		
		#remove number of dice for next role (unless all 6 score)
	end 

	def play
		#use .cycle to run turn for each player
        # iterate through all the players
        self.players.each do |player|
          turn(player)
          if victory?(current_player) == true 
        	  	puts "Congratulations you won!"
        	  	break
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



