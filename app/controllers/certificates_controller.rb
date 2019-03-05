class CertificatesController < InheritedResources::Base

  private

    def certificate_params
      params.require(:certificate).permit(:name, :description, :for_person, :for_company, :for_equipment, :for_location, :active)
    end
end

