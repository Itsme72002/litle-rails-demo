class SalesController < ApplicationController
  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sales }
    end
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
    @sale = Sale.find(params[:id])

    options = { 'merchantId' => @sale.merchantid,
		'id' => @sale.merchanttxnid,
		'reportGroup' => @sale.reportgroup,
		'orderId' => @sale.orderid,
		'orderSource' => @sale.ordersource,
		'amount' => @sale.amount,
		'card' => {
			   'number' => (@sale.cardnumber),
			   'month' => @sale.cardmonth,
			   'year' => @sale.cardyear,
                           'verification_value' => @sale.cvv
			  },
		'billToAddress' => {'fisrtName' => @sale.firstname,
			 	    'lastName' => @sale.lastname,
				    'name' => [@sale.firstname, @sale.lastname].compact.join(','),
				    'address1' => @sale.address1,
				    'city' => @sale.city,
				    'state' => @sale.state,
				    'country' => ('US' or @sale.country),
				    'zip' => @sale.zip,
				    'email' => @sale.email}	
		}
    response = ActiveMerchant::Billing::LitleGateway.sale(options)
    card = options['card']
    @number = card['number']
    @message = response.message
    if @message == 'Valid Format'
	@post = "Will charged $#{sprintf("%.2f", options['amount'].to_f / 100)} to the credit card XXXX-XXXX-XXXX-#{sprintf("%.4i", @number)[-4..-1]}"
        @litletxnid = response.saleResponse.litleTxnId
        @litlepostdate = response.saleResponse.postDate
    else
     	render :action => 'error'
    end
  end

  # GET /sales/new
  # GET /sales/new.json
  def new
    @sale = Sale.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sale }
    end
  end

  # GET /sales/1/edit
  def edit
    @sale = Sale.find(params[:id])
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(params[:sale])

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render json: @sale, status: :created, location: @sale }
      else
        format.html { render action: "new" }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sales/1
  # PUT /sales/1.json
  def update
    @sale = Sale.find(params[:id])

    respond_to do |format|
      if @sale.update_attributes(params[:sale])
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy

    respond_to do |format|
      format.html { redirect_to sales_url }
      format.json { head :ok }
    end
  end
end
