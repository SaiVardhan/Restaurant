require 'csv'

require_relative 'restaurant'

class InputReader

attr_accessor :file

	def initialize(csv_file)
		@file = csv_file
		restaurant_data = parse_csv_data(@file)
#		temp _arr = []
#		restaurant_data.each do |a|
#		 
#		temp_arr <<	Restaurant.new(a[1])	
#		end
		#schange_res_arr_to_hash(restaurant_data)
	end
	
	def file_exist?
	   File.exist?(file)
	end
	def is_csv?
		file.include?('.csv')
	end
	def parse_csv_data(file)
		if file_exist? && is_csv?
			csv_file = File.read(file)
			csv =  csv = CSV.parse(csv_file)
			csv_data = []
			csv.each do |row|
			   arr = []
			   arr << row [0]
			   arr << Restaurant.new(row[1..-1])
			   csv_data << arr
			end
			 puts csv_data.inspect
			#puts csv_data.group_by(&:first).map { |k, vs| [ k, *vs.map(&:last) ] }.inspect
			#csv_data.group_by(&:first).map { |k, vs| [ k, *vs.map(&:last) ] }
			
		else
		 	puts "File is not specified correctly"
		 	return "File is not specified correctly"
		end
	
	end
	
	def change_res_arr_to_hash(arr)
	    
		#puts Hash[arr.map {|key, value=[]| [key, value]}].inspect	
		Hash[arr.map {|key, value=[]| [key, value]}]
	end
	
	
end

file1 = File.dirname(__dir__) + '/pepsi_burger.csv'
#puts file1
ir = InputReader.new(file1)
#ir.parse_csv_data(file)
