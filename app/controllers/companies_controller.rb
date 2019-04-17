class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]


  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.order(name: :asc).page params[:page]
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  # building the nested polymorphs here enables having them in the forms 
  def new
    @company = Company.new
    @company.addresses.build
    @company.identifiers.build
    @company.permits
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
    

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
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
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
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
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
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # Nested attributes ActiveAdmin Docs    def company_params
    def company_params
       params.require(:company).permit(:id, :name, :credit_terms, :PO_required, :active, :bookkeeping_number, :line_of_business, :url, :licensee,
                addresses_attributes: [ :id, :addressable_id, :addressable_type, :street_address, :city, :state, :post_code, :map_reference, :longitude, :latitude],
                identifiers_attributes: [:id, :identifiable_id, :identifiable_type, :name, :value, :rank] )
    end
  
end
