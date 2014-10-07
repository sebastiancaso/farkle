require_relative 'die'

describe Die do
	let(:dice){Die.new}
	describe 'attributes' do 
		it "should have a farkle_cup attribute" do
			expect(dice.farkle_cup).to be_a(Array)
		end 

		it "should have a total_dice attribute" do
			expect(dice.total_dice).to eq(6)
		end
	end 

	describe '#roll_dice' do
		it "should have an array with 6 dice" do
			expect(dice.roll_dice.length).to eq(6)
		end
	end 

	describe '#set_aside_dice' do
		it "should remove selected dice from farkle_cup" do
			expect	
		end
	end

	describe '#hot_dice?' do
		it "" do
		end
	end

	describe '#update_dice' do
		it "" do
		end
	end
end  