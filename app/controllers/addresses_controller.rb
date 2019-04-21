class AddressesController < InheritedResources::Base

  def index
    @addresses = Address.order(city: :asc).page params[:page]
  end


#
# ncaddr - new company address for cases when action is originated exterally to Addresses
# handles addressable paramerts, e.g. 'Company'
# there must be simpler ways to do this!
# [TODO] clean this up
#
  def ncaddr
    @address = Address.new #(address_params)
    @address.addressable_type = 'Company'
    @address.addressable_id = params[:format]
    @address.save
    redirect_to edit_address_path(@address)
  end

  def edit
    @address = Address.find(params[:id])
    @parent = @address.addressable.name
    begin
      @name = @parent.find(@address.addressable_id).name
    rescue
    end
  end

  def show
    @address = Address.find(params[:id])
    @parent = @address.addressable
    begin   
      @name = @parent.find(@address.addressable_id).name
    rescue
    end
    
  end

  private  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -- - -

    def address_params
      params.require(:address).permit(:id, :addressable_id, :addressable_type, :street_address, :city, :state, :post_code, :map_reference, :longitude, :latitude)
    end

end

