require 'test_helper'

class SalesControllerTest < ActionController::TestCase
  setup do
    @sale = sales(:one)
    @sale2 = sales(:two)
    @sale3 = sales(:three)
    @sale4 = sales(:four)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sale" do
    assert_difference('Sale.count') do
      post :create, sale: @sale.attributes
    end

    assert_redirected_to sale_path(assigns(:sale))
  end

  test "should show sale" do
    get :show, id: @sale.to_param
    assert_response :success
  end
  test "sucessful sales" do
    get :show, id: @sale.to_param   
    assert_equal("Successfully charged an amount of $1.23 to the credit card XXXX-XXXX-XXXX-4242",assigns(:post))
    assert_template("sales/show","layouts/application")
  end
  test "invalid creditcard number" do
      get :show, id: @sale2.to_param
      assert_template("sales/error1","layouts/application")
      #assert_redirected_to(render :action => 'error1')
   end
   test "invalid expdate" do
      get :show, id: @sale3.to_param
      assert_template("sales/error1","layouts/application")
   end
   test "unsucessful transaction invalid amount" do
      get :show, id: @sale4.to_param
      assert_equal("Error validating xml data against the schema on line 9 the value has 13 digits, where precision must be within 12.",assigns(:message))
      assert_template("sales/error2","layouts/application")
    end
  test "should get edit" do
    get :edit, id: @sale.to_param
    assert_response :success
  end

  test "should update sale" do
    put :update, id: @sale.to_param, sale: @sale.attributes
    assert_redirected_to sale_path(assigns(:sale))
  end

  test "should destroy sale" do
    assert_difference('Sale.count', -1) do
      delete :destroy, id: @sale.to_param
    end

    assert_redirected_to sales_path
  end
end
