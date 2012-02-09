require 'test_helper'

class CaptureTest < ActiveSupport::TestCase
   test "the truth" do
     @capture = captures(:one)
     get :show
     puts @post 
     puts @message
     assert_equal(nil,@post)
     assert_equal("",@message)
   end
end
