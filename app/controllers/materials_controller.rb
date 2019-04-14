class MaterialsController < InheritedResources::Base


  def index
  	@materials = Material.order(name: :asc).page params[:page]
  end

  def show
  	 active_admin_comments
  end
  	
  end
  
  private

    def material_params
      params.require(:material).permit(:name, :description)
    end
end

