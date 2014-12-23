require 'csv'

require_relative 'item'

class InputReader

attr_accessor :file,:ordered_items

	def initialize(csv_file,ordered_items)
		@file = csv_file
		restaurant_data = parse_csv_data(@file)
		@ordered_items = ordered_items.map(&:capitalize)
		#change_res_arr_to_hash(restaurant_data)
		find_match_data(restaurant_data,@ordered_items)  
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
			csv = CSV.parse(csv_file)
			csv_data = {}
			csv.each do |row|
			   arr = []
			   res_item_hash = {"price" => row[1].to_f,"label" =>  row[-1].to_s.capitalize }
			   arr << res_item_hash
			   if csv_data[row[0]] 
			       
			   		csv_data[row[0]] << arr
			   else
			   		csv_data[row[0]] = arr
			   end
			    csv_data[row[0]].flatten!
			   #csv_data << arr
			end
			 puts "CSV DATA IS",csv_data.inspect
			csv_data
		else
		 	puts "File is not specified correctly"
		 	return "File is not specified correctly"
		end
	
	end
	
	def find_match_data(restaurant_data,ordered_items)
		res_ids= []
		restaurant_data.each{|k, v|
			res_ids << k if  v.detect{|hash| ordered_items.include?(hash["label"])}
		}
		puts res_ids.inspect
		res_ids
	end
	
	def find_best_restaurant_with_price(res_ids,res_data)
		
	 
		
	end
	

	
end

file1 = File.dirname(__dir__) + '/pepsi_burger.csv'
ir = InputReader.new(file1,["pepsi","BURGER"])

