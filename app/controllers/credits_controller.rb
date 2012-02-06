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
    gateway = ActiveMerchant::Billing::LitleGateway.new
  begin
   response = gateway.credit(@credits.amount,@credits.litletxnid)
  rescue
    render :action => 'error'
    end 
  if response.success?
      @post =  "Successfully refunded  $#{sprintf("%.2f", @credits.amount.to_f / 100)} using the transactionId: #{@credits.litletxnid} "   
  else
      @post =  "Unsucessful Transaction #{response.message}"   
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
