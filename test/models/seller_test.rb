require 'test_helper'

class SellerTest < ActiveSupport::TestCase
  def setup
  @seller = Seller.new(room: 3, bedroom: 2)   
  end
end
