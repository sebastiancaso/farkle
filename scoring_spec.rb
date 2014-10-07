require_relative 'scoring'


describe Scoring do
	include Scoring

	describe '#calculate_score' do

		it "expect three 1s to equal 1000 points" do
			expect(calculate_score([1,1,1])).to eq(1000)
		end 

		5.times do |i|
			it "expect three of a kind of  #{i +2} to equal #{i + 2 * 100} points" do
				num = i + 2
				expect(calculate_score([num,num,num])).to eq(num * 100)
			end 
		end 

		it "expect one 1 to equal 100 points" do
			expect(calculate_score([1])).to eq(100)
		end 

		it "expect one 5 to equal 50 points" do
			expect(calculate_score([5])).to eq(50)
		end 

		6.times.each do |i|
			it "expect four of a kind of #{i + 1} to equal 1000 points" do
				num = i + 1
				expect(calculate_score([num, num, num, num])).to eq(1000)
			end
		end 
		
		6.times.each do |i|		  
			it "expect five of a kind of #{i + 1} to equal 2000 points" do
				num = i + 1 
				expect(calculate_score([num, num, num, num, num])).to eq(2000)
			end
		end

		6.times.each do |i|
			it "expect six of a kind of #{i + 1} to equal 3000 points" do
				num = i + 1 
				expect(calculate_score([num,num,num,num,num,num])).to eq(3000)
			end
		end 

		it "expect three 1s and three 6s to equal 1600 points" do 
			expect(calculate_score([1,1,1,6,6,6])).to eq(1600)
		end 
		
	end 

	
end  