require_relative 'player'

class Game 
	attr_reader :players

	def initialize
		@players = []
	end 

	def set_num_of_players(number)
		number.times do 
			self.players <<	Player.new
		end 
	end 

	# def check_score
	# 	return self.players.cycle.points
	# end 
end 

game = Game.new
game.set_num_of_players(2)
# game.players[0].update_points(20)  
#updates players points 
#set up Game with array of players, cycle through array and run a turn have points updated
# #use .cycle until points equal 10,000
# until game.check_score > 10000
# 	game.players.each do |player|
# 		p player.update_points(rand(100..1000))
# 	end 
# end 
until game.players[0].points > 10000 || game.players[1].points > 10000
	game.players.each do |player|
		p "#{player.update_points(rand(100..1000))} for #{game.players}" 
	end 
end 





#kind of working play method

	# def play 
	# 	until self.players[0].points > 10000 || self.players[1].points > 10000 #this line means there have to be 2 players or cycle won't work
	# 		self.players.each do |player|
	# 				puts "Please roll the dice! (press 'r' to roll)"  
	# 				prompt = gets.chomp
	# 				if prompt == "r"
	# 					turn_prompt = nil
	# 					until turn_prompt == "p"	
	# 							throw_dice = Roll.new
	# 							throw_dice.farkle_cup 
	# 							throw_dice.roll_dice(6)
	# 							p throw_dice.farkle_cup
	# 							throw_dice.count_roll
	# 						if calculate_score(throw_dice.count_roll) == nil
	# 							puts "Farkle! #{throw_dice.show_roll}"
	# 							puts "press 'p' to continue"
	# 						else
	# 							p "you rolled #{throw_dice.show_roll}, your scored #{calculate_score(throw_dice.count_roll)} points. input which dice you would like to bank."
	# 							dice_choice = gets.chomp
	# 							p dice_choice
	# 							turn_score = calculate_score(calc_banked(dice_choice))
	# 							player.update_points(turn_score)
	# 							puts "you have #{player.points}, do you want to roll again or end your turn? (press 'p' to end turn)"
	# 							p throw_dice.set_aside_dice(dice_choice)
	# 							turn_prompt = gets.chomp
	# 						end 
	# 					end	
	# 				end		
				 
	# 		end 
	# 	end 
	# end 