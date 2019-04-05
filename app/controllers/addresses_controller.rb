class AddressesController < InheritedResources::Base


  # 
  # Prepend parent type to each address
  #  
  def index
    @addresses = Address.all
    @addresses.each do |addr|
      addr.addressable_type += ':  ' + Company.find(addr.addressable_id).name
    end
  end


  private

    def address_params
      params.require(:address).permit(:addressable_id, :addressable_type, :street_address, :city, :state, :post_code, :map_reference, :longitude, :latitude)
    end

end

