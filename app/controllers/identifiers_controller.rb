class IdentifiersController < InheritedResources::Base

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
    #redirect_to company_path(@parent)
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
      format.html { redirect_to companies_path, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end

  end

  private

    def identifier_params
      params.require(:identifier).permit(:id, :identifiable_type, :identifiable_id, :name, :value, :rank)
    end
end

