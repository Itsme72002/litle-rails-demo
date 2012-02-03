class CapturesController < ApplicationController
  # GET /captures
  # GET /captures.json
  def index
    @captures = Capture.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @captures }
    end
  end

  # GET /captures/1
  # GET /captures/1.json
  def show
    @capture = Capture.find(params[:id])
    gateway = ActiveMerchant::Billing::LitleGateway.new
  
   response = gateway.capture(@capture.amount,@capture.litletxnid)
    
   if response.success?
       @post =  "Successfully charged $#{sprintf("%.2f", amount.to_f / 100)} to the credit card #{credit_card.display_number}"   
   else
       @post =  "Unsucessful Transaction"   
     end
  end

  # GET /captures/new
  # GET /captures/new.json
  def new
    @capture = Capture.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @capture }
    end
  end

  # GET /captures/1/edit
  def edit
    @capture = Capture.find(params[:id])
  end

  # POST /captures
  # POST /captures.json
  def create
    @capture = Capture.new(params[:capture])

    respond_to do |format|
      if @capture.save
        format.html { redirect_to @capture, notice: 'Capture was successfully created.' }
        format.json { render json: @capture, status: :created, location: @capture }
      else
        format.html { render action: "new" }
        format.json { render json: @capture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /captures/1
  # PUT /captures/1.json
  def update
    @capture = Capture.find(params[:id])

    respond_to do |format|
      if @capture.update_attributes(params[:capture])
        format.html { redirect_to @capture, notice: 'Capture was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @capture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /captures/1
  # DELETE /captures/1.json
  def destroy
    @capture = Capture.find(params[:id])
    @capture.destroy

    respond_to do |format|
      format.html { redirect_to captures_url }
      format.json { head :ok }
    end
  end
end
