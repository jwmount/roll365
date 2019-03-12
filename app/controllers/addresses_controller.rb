class AddressesController < InheritedResources::Base

  private

    def address_params
      params.require(:address).permit(:street_address,, :city,, :state,, :po_box, :map_reference, :longitude, :latitude, :company_id, :company_type, :person_id, :person_type, :identifier_id, :identifier_type, :cert_id, :cert_type, :requirement_id, :requirement_type)
    end
end

