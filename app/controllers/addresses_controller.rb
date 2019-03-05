class AddressesController < InheritedResources::Base

  private

    def address_params
      params.require(:address).permit(:company_id, :company_type, :street{30}, :city{30}, :state{2}, :post_code{10}, :map_reference, :latitude, :longitude)
    end
end

