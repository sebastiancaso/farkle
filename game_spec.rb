require_relative 'game'

describe Game do

	before :each do 
		@game = Game.new
		@game.set_num_of_players(2)
		@player1 = @game.players[0]
	end 

	describe 'Game attributes' do 
		
		it 'should have a players attribute' do 
			expect(@game.players).to be_an_instance_of(Array)
		end 
		
		it 'should have a dice attribute' do 
			expect(@game.dice).to be_an_instance_of(Die)
		end 

		it 'should have a victory attribute' do 
			expect(@game.victory).to eq(false)
		end 

	end 


	describe '#set_num_of_players' do 
		it 'should create the specified amount of players' do
		expect(@game.players.length).to eq(2) 
		end 
	end 


	describe '#clear_farkle_cup' do 
		it 'should remove all dice from farkle cup' do 
			@game.dice.roll_dice(6)
			@game.clear_farkle_cup
			expect(@game.dice.farkle_cup.length).to eq (0)
		end 
	end


	describe '#farkle' do 
		it 'should recognize when no points are scored' do 
			expect(@game.farkle("234")).to eq(true)
		end 

		it 'should return nil when points are scored' do 
			expect(@game.farkle("11")).to eq(nil)
		end 
	end  
end 