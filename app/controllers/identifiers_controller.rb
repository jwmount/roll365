class IdentifiersController < InheritedResources::Base

  private

    def identifier_params
      params.require(:identifier).permit(:company_id, :company_type, :person_id, :person_type, :name{30}, :value{30}, :rank)
    end
end

