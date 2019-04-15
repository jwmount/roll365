class IdentifiersController < InheritedResources::Base


  def index
    @identifiers = Identifier.order(name: :asc).page params[:page]
  end
  
  def edit
    
    @identifier = Identifier.find(params[:id])
    begin
      @name = @identifier.identifiable.display_name
    rescue
      @name = flash["unknown display_name"]
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

