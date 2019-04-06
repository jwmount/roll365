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

  def edit
    @address = Address.find(params[:id])
    @parent = @address.addressable_type.constantize
    begin
      @name = @parent.find(@address.addressable_id).name
    rescue
    end
  end

  def show
    @address = Address.find(params[:id])
    @parent = @address.addressable_type.constantize
    begin   
      @name = @parent.find(@address.addressable_id).name
    rescue
    end
    
  end

  private  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -- - -

    def address_params
      #params.require(:address).permit(:id, :addressable_id, :addressable_type, :street_address, :city, :state, :post_code, :map_reference, :longitude, :latitude)
      permit_params :addressable_type, :addressable_id, :street_address, :city, :state, :post_code, :map_reference, :longitude, :latitude
    end

end

