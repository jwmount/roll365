class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    @q = Person.ransack(params[:q])
    @people = @q.result.order(last_name: 'ASC').paginate(page: params[:page], per_page: 10 || params[:per_page])
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @address = @person.addresses.where("addressable_id = ? AND addressable_type = ?", @person.id, 'Person')
  end

  # GET /people/new
  def new
    if params.has_key?('company_id')
      @company = Company.find(params[:company_id])
      @person = Person.new
      @person.company_id = params[:company_id]
      @person.save
    # OK, we came in direct, no @company_id
    else 
      flash[:warning] = "Warning:  new people must be created by company they work for.  Nice phrase ..."
    end   
    
    if @person.save
      redirect_to person_path(@person) #person GET    /organizations/people/:id(.:format)         people#show
    else
      render "company/show"
    end
  end

  # GET /people/1/edit
  # REMEMBER, dependents are created at parent create time! ! !
  def edit
  end

  # POST /people
  # POST /people.json
  def create 
    @person = Person.new(person_params)
    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private

    # Use callbacks to share common setup or constraints between actions.
    # MEMBER of collection ust already exist or obvioysly thsi will not work.
    def set_person
      begin
        @person = Person.find(params[:id])
      rescue
        flash[:warning] = "@person was not found in people#set_person."
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:id, :company_id, :first_name, :last_name, :title, :available, :available_on, :OK_to_contact, :active,
           addresses_attributes: [ :addressable_id, :addressable_type, :street_address, :city, :state, :post_code, :map_reference, :longitude, :latitude] )
      #    identifiers_attributes: [:identifiable_id, :identifiable_type, :name, :value, :rank] )
    end
end
