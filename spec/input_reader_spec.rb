require 'rspec'
require_relative '../lib/input_reader'


describe "InputReader" do
	before(:each) do
		@file = File.expand_path(File.dirname(File.dirname(__FILE__)) + '/pepsi_burger.csv')
		@ordered_items = ["Pepsi","Burger"]
		@ir = InputReader.new(@file,@ordered_items)
	end
	
	   describe "#file_exist?" do
		   it "returns true when file exits" do
			 expect(@ir.file_exist?).to be(true)
		   end
  				
	   end
	   
	   describe "#is_csv?" do
	    	it "checks the CSV extension" do
	    		expect(@ir.is_csv?).to be(true)
	    	end
		end

		context "if the file is csv and has data then parse it" do
		    before(:each) do
		    	@res_data = @ir.parse_csv_data(@file)
		    end
			describe "#prase_csv_data(file)" do 
				 it "returns hash when the file is supplied" do
				 	expect(@res_data).to be_an_instance_of(Hash)
				 end			
			end	
			
			describe "#find_match_data(restaurant_data,ordered_items)" do
			 	 it "returns the restaurants id array if ordered items are found" do
			 	    puts "res data",@res_data
			 	 	expect(@ir.find_match_data(@res_data,@ordered_items)).to eql(["1","2"])
			 	end
			end
    	end
    	
    	

end
