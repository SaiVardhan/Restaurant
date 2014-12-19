require 'rspec'
require_relative '../lib/input_reader'


describe "InputReader" do
	before(:each) do
		@file = File.expand_path(File.dirname(File.dirname(__FILE__)) + '/pepsi_burger.csv')
		@ir = InputReader.new(@file)
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
			 it "returns array with csv data" do
			 	expect(@res_data).to be_an_instance_of(Array)
			 end
			 it "#change_res_arr_to_hash(arr)" do
			 	expect(@ir.change_res_arr_to_hash(@res_data)).to be_an_instance_of(Hash)
			 end
			 
				
			end	
    	end
    	
    	

end
