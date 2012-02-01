class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])
    options = { 'merchantId' => @order.merchantid,
		'id' => @order.merchanttxnid,
                'reportGroup' => @order.reportgroup, 
                'orderId' => @order.orderid, 
                'orderSource' => @order.ordersource, 
                'amount' => @order.amount,
                'card' =>{'number' => @order.cardnumber, 'month' => @order.cardmonth, 'year' => @order.cardyear,'verification_value' => @order.cvv },
                'billToAddress' =>{'name' => @order.name,
				   'address1' => @order.address1,
				    'city' => @order.city,
				    'state' => @order.state,
				    'country' => ('US' or @order.country),
				    'zip' => @order.zip,
				    'email' => @order.email}}
 
# Pass the options hash through ActiveMerchant's LitleGateway to Litle Ruby SDK
    response = ActiveMerchant::Billing::LitleGateway.authorization(options)
    @message= response.message
    if @message == 'Valid Format'
       @litletxnid = response.authorizationResponse.litleTxnId
       @litlepostdate = response.authorizationResponse.postDate
       @post = "Will charged $#{sprintf("%.2f", options['amount'].to_f / 100)} to the credit card XXXX-XXXX-XXXX-#{sprintf("%.4i", options['card']['number'])[-4..-1]}"
    else
       render :action => 'error'
    end

  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :ok }
    end
  end
end
