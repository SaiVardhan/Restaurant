class InputReader

attr_accessor :file

	def initialize(csv_file)
		@file = csv_file
	end
	
	def file_exist?
	   File.exist?(file)
	end
	def file_extn?
		file.include?('.csv')
	end
	
	
end
