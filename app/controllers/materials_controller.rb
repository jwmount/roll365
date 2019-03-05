class MaterialsController < InheritedResources::Base

  private

    def material_params
      params.require(:material).permit(:name, :description)
    end
end

