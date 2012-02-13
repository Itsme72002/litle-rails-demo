require 'test_helper'

class IntegratedTransactTest < ActionDispatch::IntegrationTest
  fixtures :orders

  test "sucessful transaction set ord capt cred void" do
    # #authorization
    @order = orders(:one)
    get "orders/" + @order.to_param
    assert_equal("Successfully authorized an amount of $1.23 to the credit card XXXX-XXXX-XXXX-4242",assigns(:post))
    assert_template("orders/show","layouts/application")
    @authtxnid = assigns(:litletxnid)
    #capture
    post_via_redirect '/captures', :capture => {:litletxnid => @authtxnid, :amount => 1233}
    assert_equal("Successfully charged $12.33 using the transactionId: "+@authtxnid,assigns(:post))
    assert_template("captures/show","layouts/application")
    @captxnid =assigns(:litletxnid)
    #credit
    post_via_redirect '/credits', :credit => {:litletxnid => @captxnid, :amount => 533}
    assert_equal("Successfully refunded  $5.33 using the transactionId: "+@captxnid +" ",assigns(:post))
    assert_template("credits/show","layouts/application")
    #void
    post_via_redirect '/voids', :void => {:litletxnid => @captxnid}
    assert_equal("Successfully Voided the Transaction "+@captxnid,assigns(:post))
    assert_template("voids/show","layouts/application")
  end
  test "sucessful transaction set sale cred void" do
    # sale
    @sale = sales(:one)
    get "sales/" + @sale.to_param
    assert_equal("Successfully charged an amount of $1.23 to the credit card XXXX-XXXX-XXXX-4242",assigns(:post))
    assert_template("sales/show","layouts/application")
    @saletxnid = assigns(:litletxnid)
    #credit
    post_via_redirect '/credits', :credit => {:litletxnid => @saletxnid, :amount => 533}
    assert_equal("Successfully refunded  $5.33 using the transactionId: "+@saletxnid +" ",assigns(:post))
    assert_template("credits/show","layouts/application")
    #void
    post_via_redirect '/voids', :void => {:litletxnid => @saletxnid}
    assert_equal("Successfully Voided the Transaction "+@saletxnid,assigns(:post))
    assert_template("voids/show","layouts/application")
  end
  test "just token" do
    @token = tokens(:one)
    get "tokens/" + @token.to_param
    assert_equal("Successfully stored token with ID:",assigns(:post))
    assert_template("tokens/show","layouts/application")
  end
  test "network" do
    https!
    get "/captures"
    assert_response :success
  end
end
