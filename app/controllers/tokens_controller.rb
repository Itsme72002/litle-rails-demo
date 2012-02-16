class TokensController < ApplicationController
  # GET /tokens
  # GET /tokens.json
  def index
    @tokens = Token.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tokens }
    end
  end
  
  # GET /tokens/1
  # GET /tokens/1.json
  def show
    @token = Token.find(params[:id])
    gateway = ActiveMerchant::Billing::LitleGateway.new
    
    credit_card = ActiveMerchant::Billing::CreditCard.new(
    :name               => @token.name,
    :number             => @token.cardnumber,
    :month              => @token.cardmonth,
    :year               => @token.cardyear,
    :verification_value => @token.cvv)
    options = { 
    'billToAddress' => {
            'name' => @token.name,
            'address1' => @token.address1,
            'city' => @token.city,
            'state' => @token.state,
            'country' => ('US' or @token.country),
            'zip' => @token.zip,
            'email' => @token.email}  
    }
    if credit_card.valid?
        response = gateway.store(credit_card,options)
 
      if response.success?
        @post =  "Successfully stored token:" 
        @tokenid = response.params['litleOnlineResponse'].registerTokenResponse.litleToken 
        
      else
        @message = response.message
        render :action => 'error2'     
      end
      
    else
      render :action =>'error1'  
    end
    
  end
  
  # GET /tokens/new
  # GET /tokens/new.json
  def new
    @token = Token.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @token }
    end
  end
  
  # GET /tokens/1/edit
  def edit
    @token = Token.find(params[:id])
  end
  
  # POST /tokens
  # POST /tokens.json
  def create
    @token = Token.new(params[:token])
    
    respond_to do |format|
      if @token.save
        format.html { redirect_to @token, notice: 'Token was successfully created.' }
        format.json { render json: @token, status: :created, location: @token }
      else
        format.html { render action: "new" }
        format.json { render json: @token.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PUT /tokens/1
  # PUT /tokens/1.json
  def update
    @token = Token.find(params[:id])
    
    respond_to do |format|
      if @token.update_attributes(params[:token])
        format.html { redirect_to @token, notice: 'Token was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @token.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /tokens/1
  # DELETE /tokens/1.json
  def destroy
    @token = Token.find(params[:id])
    @token.destroy
    
    respond_to do |format|
      format.html { redirect_to tokens_url }
      format.json { head :ok }
    end
  end
end
