require 'test_helper'

class TokensControllerTest < ActionController::TestCase
  setup do
    @token = tokens(:one)
    @token2 = tokens(:two)
    @token3 = tokens(:three)
    @token4 = tokens(:four)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tokens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create token" do
    assert_difference('Token.count') do
      post :create, token: @token.attributes
    end

    assert_redirected_to token_path(assigns(:token))
  end

  test "should show token" do
    get :show, id: @token.to_param
    assert_response :success
  end
  test "sucessful token" do
    get :show, id: @token.to_param   
    assert_equal("Successfully stored token with ID:",assigns(:post))
    assert_template("tokens/show","layouts/application")
  end
  test "invalid creditcard number" do
     get :show, id: @token2.to_param
     assert_template("tokens/error1","layouts/application")
     #assert_redirected_to(render :action => 'error1')
  end
  test "invalid expdate" do
    get :show, id: @token3.to_param
    assert_template("tokens/error1","layouts/application")
  end
  #test "unsucessful transaction invalid amount" do
  #  get :show, id: @token4.to_param
  #  assert_equal("Error validating xml data against the schema on line 9 the value has 13 digits, where precision must be within 12.",assigns(:message))
  #  assert_template("tokens/error2","layouts/application")
  #end
  test "should get edit" do
    get :edit, id: @token.to_param
    assert_response :success
  end

  test "should update token" do
    put :update, id: @token.to_param, token: @token.attributes
    assert_redirected_to token_path(assigns(:token))
  end

  test "should destroy token" do
    assert_difference('Token.count', -1) do
      delete :destroy, id: @token.to_param
    end

    assert_redirected_to tokens_path
  end
end
