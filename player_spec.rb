require_relative 'player'

describe Player do 
	
	before :each do 
		@player = Player.new
	end 
	
	describe 'initialized attributes' do 
		it 'should have a points attribute' do 
			expect(@player.points).to eq(0)
		end 

		it 'should have a turn_points attribute' do 
			expect(@player.turn_points).to eq(0)
		end 
	end

	describe '#update_points' do 
		it 'should update the players points' do 
			@player.update_points(10)
			expect(@player.points).to eq(10)
		end
	end

	describe '#show_score' do 
		it 'should output players score' do
			@player.update_points(10)
			expect(@player.show_score).to eq(10) 
		end
	end  

	describe '#update_game_points' do 
		it 'should update the players points using turn points' do 
			@player.turn_points = 10
			@player.update_game_points
			expect(@player.points).to eq(10)
		end 
	end

end 