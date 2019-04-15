class AddressesController < InheritedResources::Base

  def index
    @addresses = Address.order(post_code: :asc).page params[:page]
  end


  def edit
    @address = Address.find(params[:id])
    #@parent = @address.addressable_type.constantize.  REMOVE soon 15April
    @parent = @address.addressable.name
    begin
      @name = @parent.find(@address.addressable_id).name
    rescue
    end
  end

  def show
    @address = Address.find(params[:id])
    #@parent = @address.addressable_type.constantize. REMOVE soon after 15April
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

