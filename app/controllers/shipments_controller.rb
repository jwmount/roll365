class ShipmentsController < ApplicationController
  before_action :set_shipment, only: [:close, :show, :edit, :update, :destroy]

  # GET /shipments
  # GET /shipments.json
  #def index
  #  @shipments = Shipment.all
  #end

  # works with route defined in routes.rb, not used so far
  def close
    @shipment.status == 'Closed'
    @shipment.save
    redirect_to @shipment
  end

  def index
    @q = Shipment.ransack(params[:q])
    @shipments = @q.result.order(tracking_id: 'ASC').paginate(page: params[:page], per_page: 10 || params[:per_page])
  end

  #
  # Same as Index except has _seaerch_panel
  #
  def search
    @q = Shipment.ransack(params[:q])
    @shipments = @q.result.order(tracking_id: 'ASC').paginate(page: params[:page], per_page: 10 || params[:per_page])
  end

  # GET /shipments/1
  # GET /shipments/1.json
  def show
  end

  # GET /shipments/new
  def new
    @shipment = Shipment.new
  end

  # GET /shipments/1/edit
  def edit
  end

  # POST /shipments
  # POST /shipments.json
  def create
    begin
      @shipment = Shipment.new(shipment_params)
    rescue ActiveRecord::RecordNotIUnique => e
      redirect_to @shipment, {notice: 'ohoh'}
    end
    respond_to do |format|
      if @shipment.save
        format.html { redirect_to @shipment, notice: 'Shipment was successfully created.' }
        format.json { render :show, status: :created, location: @shipment }
      else
        format.html { render :new }
        format.json { render json: @shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shipments/1
  # PATCH/PUT /shipments/1.json
  def update
     @shipment = Shipment.find(params[:id])
     respond_to do |format|
       if @shipment.update!(shipment_params)
        format.html { redirect_to @shipment, notice: "#{@shipment.tracking_id} Shipment has been updated." }
        format.json { render :show, status: :ok, location: @shipment }
      else
        format.html { render :edit }
        format.json { render json: @shipment.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /shipments/1
  # DELETE /shipments/1.json
  def destroy
    # @shipment.destroy
    respond_to do |format|
      format.html { redirect_to shipments_url, notice: "Shipment is closed and cannot be modified." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipment
      @shipment = Shipment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shipment_params
      params.require(:shipment).permit(:tracking_id, :ship_from, :ship_to, :pickup, :deadline, :cargo, :utilization, :quote_basis, 
               :quote_complete, :status )
    end
end
