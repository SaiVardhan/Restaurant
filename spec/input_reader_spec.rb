require 'rspec'
require_relative '../lib/input_reader'


describe "InputReader" do
	before(:each) do
		@file = File.expand_path(File.dirname(File.dirname(__FILE__)) + '/pepsi_burger.csv')
		@ir = InputReader.new(@file)
	end
	
	   describe "#file_exist" do
		   it "returns true when file exits" do
			 expect(@ir.file_exist?).to be(true)
		   end
#			it "returns false when file doesnot exist" do
#			 #@file = ''
#			 expect(@ir.file_exist?).to_not be(false)
#			end	  				
	   end
	   
	   describe "#file_extension" do
	    	it "checks the CSV extension" do
	    		expect(@ir.file_extn?).to be(true)
	    	end
	   end

end
