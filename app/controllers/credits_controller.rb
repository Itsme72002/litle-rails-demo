class CreditsController < ApplicationController
  # GET /credits
  # GET /credits.json
  def index
    @credits = Credit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @credits }
    end
  end

  # GET /credits/1
  # GET /credits/1.json
def show
    @credits = Credit.find(params[:id])
    gateway = ActiveMerchant::Billing::LitleGateway.new(
            :login => 'PHXMLTEST',
            :password => 'certpass')
    
    amount =  @credits.amount
  

    options = { 
		'orderSource' => 'ecommerce',
		'billToAddress' => {'fisrtName' => @credits.firstname,
			 	    'lastName' => @credits.lastname,
				    'name' => [@credits.firstname, @credits.lastname].compact.join(','),
				    'address1' => @credits.address1,
				    'city' => @credits.city,
				    'state' => @credits.state,
				    'country' => ('US' or @credits.country),
				    'zip' => @credits.zip,
				    'email' => @credits.email}	
		}
    credit_card = ActiveMerchant::Billing::CreditCard.new(
                :first_name         => @credits.firstname,
                :last_name          => @credits.lastname,
                :number             => @credits.cardnumber,
                :month              => @credits.cardmonth,
                :year               => @credits.cardyear,
                :verification_value => @credits.cvv)

  
if credit_card.valid?
    response = gateway.credit(amount,credit_card,options)

    if response.success?
        @post =  "Successfully charged $#{sprintf("%.2f", amount.to_f / 100)} to the credit card #{credit_card.display_number}"   
    else
   	@post =  "Unsucessful Transaction"   
    end
else
    render :action => 'error'  
end

 end

  # GET /credits/new
  # GET /credits/new.json
  def new
    @credit = Credit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @credit }
    end
  end

  # GET /credits/1/edit
  def edit
    @credit = Credit.find(params[:id])
  end

  # POST /credits
  # POST /credits.json
  def create
    @credit = Credit.new(params[:credit])

    respond_to do |format|
      if @credit.save
        format.html { redirect_to @credit, notice: 'Credit was successfully created.' }
        format.json { render json: @credit, status: :created, location: @credit }
      else
        format.html { render action: "new" }
        format.json { render json: @credit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /credits/1
  # PUT /credits/1.json
  def update
    @credit = Credit.find(params[:id])

    respond_to do |format|
      if @credit.update_attributes(params[:credit])
        format.html { redirect_to @credit, notice: 'Credit was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @credit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credits/1
  # DELETE /credits/1.json
  def destroy
    @credit = Credit.find(params[:id])
    @credit.destroy

    respond_to do |format|
      format.html { redirect_to credits_url }
      format.json { head :ok }
    end
  end
end
