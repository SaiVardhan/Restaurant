require 'rspec'
require_relative '../lib/item'

describe "Item" do
	before(:each) do 
	    @item_arr = ["1.5", "Pepsi"]
		@item  = Item.new(@item_arr)
	end
	
	describe "#change_val_to_hash(price,label)" do
		
		
		it "checks the price key values is of decimal value or not" do
			price_val = @item.change_val_to_hash(@item_arr[0],@item_arr[1])[:price]
			expect(price_val).to be_an_instance_of(Float)
		end
		
		it "takes price,item array and return a hash" do
			expect(@item.change_val_to_hash(@item_arr[0],@item_arr[1])).to eq({})
		end
		
	end

end
