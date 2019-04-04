class AddressesController < InheritedResources::Base

 
   
  def index
 
    @addresses = Address.corporate
    @projects = Address.project
    @people = Address.person

    @addresses.each do |addr|
     	@company_name = Company.find(addr.addressable_id).name
        addr.addressable_type = @company_name
    end

    @projects.each do |addr|
      @proj_name = Project.find(addr.addressable_id).name
      addr.addressable_type = @proj_name
    end

    @people.each do |addr|
      @person_name = People.find(addr.addressable_id).name
      addr.addressable_type = @person_name
    end

  end

  private

    def address_params
      params.require(:address).permit(:addressable_id, :addressable_type, :street_address, :city, :state, :post_code, :map_reference, :longitude, :latitude)
    end
end

