class AddressesController  < ApplicationController # < InheritedResources::Base
  # Error, Uninitialized Constant InheritedResources is the Cause of the Routing Error about that, bad punctuation in message is confusing
  
  # An address member is created when a new member of Company or Person collections are created.  
  def index
    # effectively define scope
    case 
      when params.has_key?(:company_id)
        @parent = Company.find(params[:company_id])
        @addresses = @parent.addresses
    
      when params.has_key?(:person_id)
        @parent = Person.find(params[:person_id])
        @addresses = @parent.addresses
    
      else
        @addresses = Address.all
    end
    
    if @addresses.empty?
      flash.now[:Error] = "Address addressable does not exist for some member."
      redirect_to welcome_landing_path
    end
    
    @q = @addresses.ransack(params[:q])
    @addresses = @q.result.order(city: 'ASC').paginate(page: params[:page], per_page: 10 || params[:per_page])
    
  end

  # get @address and @parent
  def edit
    begin
      @address = Address.find(params[:id])
    rescue
      flash[:Error] = "Address was not found using #{params[:id]}.  See your Sys Admin.}"
      redirect_to addresses_path
    end
    begin
      @parent = @address.addressable    
    rescue
      flash[:Error] = "Parent, a.k.a. Addressable, record not found."
      
    end
  end
  
  #
  # No direct operation is allowed, must be from an addressable parent
  #
  def new
    if params.has_key?(:person_id)
      @person = Person.find(params[:person_id])
      @address = @person.addresses.new
      @address.save!
      redirect_to address_path(@address)
    else
      @company = Company.find(params[:format])
      @address = @company.addresses.first
    end
  end

  def show
    @address = Address.find(params[:id])
    @parent = @address.addressable
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    @address = Address.find(params[:id])
    respond_to do |format|
      if @address.update!(address_params)
        format.html { redirect_to @address, notice: "Address has been updated." }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    respond_to do |format|
      format.html { redirect_to addresses_path, notice: "Address has been deleted." }
      format.json { head :no_content }
    end
  end

  private  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -- - -

#
  def address_params
    params.require(:address).permit( :addressable_id, :addressable_type, :street_address, :city, :state, :post_code, :map_reference, :longitude, :latitude)
  end

end

