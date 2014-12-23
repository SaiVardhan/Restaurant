class Item

attr_accessor :items#,:price,:label

	def initialize(items)
		@price = items[0]
		@label = items[1]
		change_val_to_hash(@price,@label)		
	end
	
	def change_val_to_hash(price,label)
		res_price_hash = {:price => price.to_f }
		res_label_hash = {:label => label.to_s}
		res_item_hash = res_price_hash.merge(res_label_hash)
#		res_item_hash
#		
#		{
#			price: price.to_f,
#			label: label.to_s
#		}
		#puts res_item_hash.inspect
	end
	
	#10, pepsi

	

end
