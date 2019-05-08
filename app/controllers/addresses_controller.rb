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

  def edit
    @company = Company.find(params[:id])
    @address = @company.addresses.first
  end
  
  #
  # No direct operation is allowed, must be from an addressable parent
  #
  def new
    if params.has_key?('person_id')
      @person = Person.find(params[:person_id])
      @address = @person.addresses.new
      @address.save
      redirect_to person_path(@person)
    else
      @company = Company.find(params[:format])
      @address = @company.addresses.first
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

