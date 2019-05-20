class ConditionsController  < ApplicationController

  
  def index
    @q = Condition.ransack(params[:q])
    @conditions = @q.result.order(name: 'ASC').paginate(page: params[:page], per_page: 10 || params[:per_page])
    flash[:info] = "Hang on there while the actions get defined, apparently they were all in ActiveAdmin"
  end

  def new
    @condition = Condition.new
  end

  def create
  	@condition = Condition.new(condition_params)
  	respond_to do |format|
      if @condition.save
        format.html { redirect_to @condition, notice: 'Condition was successfully created.' }
        format.json { render :show, status: :created, location: @condition }
      else
        format.html { render :new }
        format.json { render json: @condition.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  	@condition = Condition.find(params[:id])
  end
  	

  private

    def condition_params
      params.require(:condition).permit(:name, :verbiage, :indication, :status, :approved, :change_approved_by, :change_approved_at)
    end
end

