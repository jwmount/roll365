class IdentifiersController  < ApplicationController # < InheritedResources::Base< InheritedResources::Base

  #
  # if we have params we have a parent (some other member of some collection, e.g. Company)
  # this may become extraneous
  #
  def index
    if params.has_key?("company_id")
      @parent = Company.find(params[:company_id])
      @identifiers = @parent.identifiers
    else
      @identifiers = Identifier.all
    end
  end
  
  #
  # No direct operation is allowed, must be from an -able parent
  #
  def new
    @parent = Company.find(params[:company_id])
    @identifier = @parent.identifiers.new
    @identifier.save!
  end

  def edit
    @identifier = Identifier.find(params[:id])
    begin
      @name = @identifier.identifiable.display_name
    rescue
      @name = flash["Identifier has unknown display_name"]
    end
  end

  def show
    @identifier = Identifier.find( params[:id] )
    @name = @identifier.identifiable.display_name
  end

  def destroy
    @identifier = Identifier.find( params[:id] )
    @identifier.destroy
    respond_to do |format|
      format.html { redirect_to companies_path, notice: 'Contact was successfully deleted.' }
      format.json { head :no_content }
    end
  end


 # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    @identifier = Identifier.find(params[:id])
    respond_to do |format|
      if @identifier.update!(identifier_params)
        format.html { redirect_to @identifier, notice: "{@identifier} has been updated." }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @identifier.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def identifier_params
      params.require(:identifier).permit(:identifiable_type, :identifiable_id, :name, :value, :rank)
    end
end

