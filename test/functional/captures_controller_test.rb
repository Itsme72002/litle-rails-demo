require 'test_helper'

class CapturesControllerTest < ActionController::TestCase
  setup do
    @capture = captures(:one)
    @capture2 = captures(:two)
   # @capture3= captures(:three)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:captures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create capture" do
    assert_difference('Capture.count') do
      post :create, capture: @capture.attributes
    end

    assert_redirected_to capture_path(assigns(:capture))
  end
  test "should show capture" do
    get :show, id: @capture.to_param
    assert_response :success
  end
  test "invalid litleTxnId" do
      get :show, id: @capture.to_param
      assert_equal(assigns(:message),"No transaction found with specified litleTxnId")
  end
  test "no amount" do
      get :show, id: @capture2.to_param
      assert_equal(assigns(:message),'Error validating xml data against the schema on line 9 Content of element "amount" is incomplete')
  end
 # test "to large litleTxnId" do 
 #   get :show, id: @capture3.to_param
 #   assert_equal(assigns(:message), 'Error validating xml data against the schema on line 8 "01010100101010101213213213" does not satisfy the "long" type')
 # end

  test "should get edit" do
    get :edit, id: @capture.to_param
    assert_response :success
  end

  test "should update capture" do
    put :update, id: @capture.to_param, capture: @capture.attributes
    assert_redirected_to capture_path(assigns(:capture))
  end

  test "should destroy capture" do
    assert_difference('Capture.count', -1) do
      delete :destroy, id: @capture.to_param
    end

    assert_redirected_to captures_path
  end
  
end
