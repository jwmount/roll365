class PermitsController < InheritedResources::Base

  private

    def permit_params
      params.require(:permit).permit(:permitable_id, :permitable_type, :name, :description, :issuer, :jurisdiction, :basis, :required, :for_person, :for_company, :for_equipment, :for_location, :permanent, :valid_from, :valid_to)
    end
end

