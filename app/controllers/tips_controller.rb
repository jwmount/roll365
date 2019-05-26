class TipsController  < ApplicationController # < InheritedResources::Base< InheritedResources::Base

  before_action :set_tip, only: [:edit, :update, :destroy]

  def index
    @q = Tip.ransack(params[:q])
    @tips = @q.result.order(name: 'ASC').paginate(page: params[:page], per_page: 10 || params[:per_page])
    flash[:Information] = "Tip sites are usually land fills or disposal facilities.  Materials accepted vary."
  end

  def show
    @tip = Tip.find(params[:id])
  end

  def edit
  	@tip = set_tip
  end

  def new
  	@tip = Tip.new
  end
  	
  # POST /companies
  # POST /companies.json
  def create
    @tip = Tip.new(tip_params)
    respond_to do |format|
      if @tip.save
        format.html { redirect_to @tip, notice: 'Tip was successfully created.' }
        format.json { render :show, status: :created, location: @tip }
      else
        format.html { render :new }
        format.json { render json: @tip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tips/1
  # PATCH/PUT /tips/1.json
  def update
    respond_to do |format|
      if @tip.update!(tip_params)
        format.html { redirect_to @tip, notice: "#{@tip.name} tip has been updated." }
        format.json { render :show, status: :ok, location: @tip }
      else
        format.html { render :edit }
        format.json { render json: @tip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tip/1
  # DELETE /tip/1.json
  def destroy
    @tip.destroy
    respond_to do |format|
      format.html { redirect_to tip_url, notice: 'Tip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private

    # Use callbacks to share common setup or constraints between actions.
    def set_tip
      @tip = Tip.find(params[:id])
    end

    def tip_params
      params.require(:tip).permit(:name, :fee, :fire_ant_risk_level)
    end
end

