require_relative 'die'
require_relative 'roll'
require_relative 'scoring'
require_relative 'player'
#wrap scoring behavior in module and include it in the class that will wrap game logic?
# a = Die.new
# roll = []
# turn_score = []

puts "Would you like to play Farkle? (y/n)"
response = gets.chomp
if response == "y"
	puts "Great! Please roll the dice! (press 'r' to roll)"
	
	#put Game creation instance here  
		prompt = gets.chomp
		if prompt == "r"
			turn_prompt = nil
			until turn_prompt == "p"	
				throw_dice = Roll.new
				throw_dice.roll_dice(6)
				throw_dice.count_roll
				if calculate_score(throw_dice.count_roll) == nil
					puts "Farkle! #{throw_dice.show_roll}"
				else
					p "you rolled #{throw_dice.show_roll}, your scored #{calculate_score(throw_dice.count_roll)} points. input which dice you would like to bank."
					dice_choice = gets.chomp
					turn_score = calculate_score(calc_banked(dice_choice))
					player.update_points(turn_score)
					puts "you have #{player.points}, do you want to roll again or end your turn?"
					turn_prompt = gets.chomp
				end 
			end	
		end		
	 
else
	puts "Fair enough, please play soon!"
end 