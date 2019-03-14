class AddressesController < InheritedResources::Base

  private

    def address_params
      params.require(:address).permit(:addressable_id, :addressable_type, :street_address, :city, :state, :post_code :map_reference, :longitude, :latitude)
    end
end

