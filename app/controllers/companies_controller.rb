class CompaniesController < ApplicationController

  # GET /companies
  # GET /companies.json
  # @q is a relation
  # @companies = returns a collection, we sort and paginate based on that
  def index
    @q = Company.ransack(params[:q])
    @companies = @q.result.order(name: 'ASC').paginate(page: params[:page], per_page: 10 || params[:per_page])
  end


  # GET /companies/1
  # GET /companies/1.json
  def show
    @company = set_company
    begin
      @identifiers = @company.identifiers
    rescue
      flash[:error] = 'No identifiers found.'
    end 
    begin
      @address = Address.where("addressable_id = ? AND addressable_type = ?", @company.id, 'Company').limit(1)
    rescue
      flash[:error] = "No address found."
    end
    begin
      @people = @company.people
    rescue
      flash[:error] = "No people are affiliated."
    end
  end


  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
    @address = Address.where("addressable_id = ? AND addressable_type = ?", @company.id, 'Company').limit(1)
  end

  # A new Company must have it's dependents (polymorpths) from inception, we enforce that here.
  def new
    @company = Company.find_or_create_by(name: 'New Company')
    begin
      @company.save!
    rescue
      flash[:error] = "Company NOT be found or was not created."
      nil
    end
    @address = @company.addresses.find_or_create_by( {addressable_type: 'Company', addressable_id: @company.id} )
    @address.save!
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(nested_params)
    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    @company = Company.find(params[:id])
    respond_to do |format|
      if @company.update!(nested_params)
        format.html { redirect_to @company, notice: "{@company} has been updated." }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company = set_company
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_path, notice: "#{@company.name} has been deleted." }
      format.json { head :no_content }
    end
  end

#
# UJS, do totals this way for quotes and lanes
#
  def totals
    value = 101 # Some expensive database query
    render js: "$('#dashboard-totals').html('#{value}')"
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # Nested attributes 
    def nested_params

      params.require(:company).permit( :id, :name, :credit_terms, :PO_required, :active, :bookkeeping_number, :line_of_business, :url,  
        address_attributes: [:addressable_id, :addressable_type, :street_address, :city, :state, :post_code, :map_reference, :longitude, :latitude],
        identifier_attributes: [:id, :identifiable_id, :identifiable_type, :name, :value, :rank]
        )
        #params.require(:portrait_tag).permit(:id, :addressable_id => [])
        #person: [ :id, :people_id ] 
    end
  
end
