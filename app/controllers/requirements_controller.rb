class RequirementsController < InheritedResources::Base

  private

    def requirement_params
      params.require(:requirement).permit(:require_id, :require_type, :certificate_id, :for_person, :for_company, :for_location, :preference, :description)
    end
end

