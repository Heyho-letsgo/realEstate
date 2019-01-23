require 'test_helper'

class BuyerTest < ActiveSupport::TestCase
 
 def setup
  @buyer = Buyer.new(room: 1, bedroom: 1)
 end
 
 test "room should be present" do
   @buyer.room =""
   assert_not @buyer.valid?
 end
 
 
 test "bedroom should be present" do
   @buyer.bedroom =""
   assert_not @buyer.valid?
 end
 
 
 test "room should be valid" do
   @buyer.room ="A"
   assert_not @buyer.valid?
  end
  
  test "bedroom should be valid" do
   @buyer.bedroom ="A"
   assert_not @buyer.valid?
  end
 
 
 
end
