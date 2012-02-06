class VoidsController < ApplicationController
  # GET /voids
  # GET /voids.json
  def index
    @voids = Void.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @voids }
    end
  end

  # GET /voids/1
  # GET /voids/1.json
  def show
    gateway = ActiveMerchant::Billing::LitleGateway.new
    
    @void = Void.find(params[:id])

    response = gateway.void(@void.litletxnid)
    
    if response.success?
            @post =  "Sucessfully Voided the Transaction #{@void.litletxnid}"   
    else
      @post = response.message #render :action => 'error'  
    end
  end

  # GET /voids/new
  # GET /voids/new.json
  def new
    @void = Void.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @void }
    end
  end

  # GET /voids/1/edit
  def edit
    @void = Void.find(params[:id])
  end

  # POST /voids
  # POST /voids.json
  def create
    @void = Void.new(params[:void])

    respond_to do |format|
      if @void.save
        format.html { redirect_to @void, notice: 'Void was successfully created.' }
        format.json { render json: @void, status: :created, location: @void }
      else
        format.html { render action: "new" }
        format.json { render json: @void.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /voids/1
  # PUT /voids/1.json
  def update
    @void = Void.find(params[:id])

    respond_to do |format|
      if @void.update_attributes(params[:void])
        format.html { redirect_to @void, notice: 'Void was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @void.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voids/1
  # DELETE /voids/1.json
  def destroy
    @void = Void.find(params[:id])
    @void.destroy

    respond_to do |format|
      format.html { redirect_to voids_url }
      format.json { head :ok }
    end
  end
end
