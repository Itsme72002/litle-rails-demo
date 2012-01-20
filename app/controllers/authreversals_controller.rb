class AuthreversalsController < ApplicationController
  # GET /authreversals
  # GET /authreversals.json
  def index
    @authreversals = Authreversal.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @authreversals }
    end
  end

  # GET /authreversals/1
  # GET /authreversals/1.json
  def show
    @authreversal = Authreversal.find(params[:id])

    options = { 'merchantId' => @authreversal.merchantid,
                'id' => @authreversal.merchanttxnid,
		'reportGroup' => @authreversal.reportgroup,
		'litleTxnId' => @authreversal.litletxnid,
		'amount' => @authreversal.amount
	      }
    response = ActiveMerchant::Billing::LitleGateway.authReversal(options)
    @message = response.message
    if @message == 'Valid Format'
        @litletxnid = response.authReversalResponse.litleTxnId
        @litlepostdate = response.authReversalResponse.postDate
	@post = "Will charged $#{sprintf("%.2f", options['amount'].to_f / 100)} to the Authorizaion transcation #{@authreversal.litletxnid}"
    else
     	render :action => 'error'
    end
  end

  # GET /authreversals/new
  # GET /authreversals/new.json
  def new
    @authreversal = Authreversal.new


  end

  # GET /authreversals/1/edit
  def edit
    @authreversal = Authreversal.find(params[:id])
  end

  # POST /authreversals
  # POST /authreversals.json
  def create
    @authreversal = Authreversal.new(params[:authreversal])

    respond_to do |format|
      if @authreversal.save
        format.html { redirect_to @authreversal, notice: 'Authreversal was successfully created.' }
        format.json { render json: @authreversal, status: :created, location: @authreversal }
      else
        format.html { render action: "new" }
        format.json { render json: @authreversal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /authreversals/1
  # PUT /authreversals/1.json
  def update
    @authreversal = Authreversal.find(params[:id])

    respond_to do |format|
      if @authreversal.update_attributes(params[:authreversal])
        format.html { redirect_to @authreversal, notice: 'Authreversal was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @authreversal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authreversals/1
  # DELETE /authreversals/1.json
  def destroy
    @authreversal = Authreversal.find(params[:id])
    @authreversal.destroy

    respond_to do |format|
      format.html { redirect_to authreversals_url }
      format.json { head :ok }
    end
  end
end
