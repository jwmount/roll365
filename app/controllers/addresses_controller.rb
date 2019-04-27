class AddressesController < InheritedResources::Base

  def index
    @addresses = Address.order(city: :asc).page params[:page]
  end


#
# ncaddr - address new or edit, return to proper controller type based on params[:format]
#
  def ncaddr
    redirect_to companies_path if params[:format] == 'Company'
    redirect_to initializer_path if params[:format] == 'Initializer'
    redirect_to people_path if params[:format] == 'Person'
  end

  def caddr
  end
  
=begin
  def edit
    @address = Address.find(params[:id])
    @parent = @address.addressable.name
    begin
      @name = @parent.find(@address.addressable_id).name
    rescue
    end
  end
=end 

  def edit
    @company = Company.find(params[:id])
    @address = @company.addresses.first
  end
  #
  # No direct operation is allowed, must be from an addressable parent
  #
  def new
    @company = Company.find(params[:format])
    @address = @company.addresses.first
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

