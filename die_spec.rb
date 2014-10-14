require_relative 'die'

describe Die do
	# let(:dice){Die.new}

	before :each do 
		@dice = Die.new
	end 
	
	describe 'attributes' do 
		it "should have a farkle_cup attribute" do
			expect(@dice.farkle_cup).to be_a(Array)
		end 

		it "should have a total_dice attribute" do
			expect(@dice.total_dice).to eq(6)
		end
	end 

	describe '#roll_dice' do
		it "should have an array with the correct amount of dice" do
			expect(@dice.roll_dice(4).length).to eq(4)
		end
	end 

	describe '#set_aside_dice' do
		it "should remove selected dice from farkle_cup" do
			@dice.farkle_cup << '1234'
			expect(@dice.set_aside_dice('12')).to eq('12')	
		end
	end

	describe '#hot_dice?' do
		it "should recognize when all dice have been scored" do
			@dice.farkle_cup 
			expect(@dice.hot_dice?).to eq(true)			
		end
	end
end  