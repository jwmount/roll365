  ActiveAdmin.register Address do

  menu parent: "Admin"


    def address_params
      params.require(:address).permit(:addressable_id, :addressable_type, :street_address, :city, :state, :post_code, :map_reference, :longitude, :latitude)
    end

end