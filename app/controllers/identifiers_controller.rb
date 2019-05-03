class IdentifiersController < InheritedResources::Base

  def index
    @parent = Company.find(params[:company_id])
    @identifiers = @parent.identifiers
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

  private

    def identifier_params
      params.require(:identifier).permit(:id, :identifiable_type, :identifiable_id, :name, :value, :rank)
    end
end

