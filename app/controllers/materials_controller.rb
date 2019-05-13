class MaterialsController  < ApplicationController # < InheritedResources::Base< InheritedResources::Base


  def index
  	@materials = Material.order(name: :asc).page params[:page]
  end

 
  private

    def material_params
      params.require(:material).permit(:id, :name, :description)
    end

end

