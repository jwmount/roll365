class IdentifiersController < InheritedResources::Base


  def edit
    @identifier = Identifier.find(params[:id])
    @parent = @identifier.identifiable_type.constantize
    begin
      @name = @parent.find(@identifier.indentifiable_id).name
    rescue
    end
  end

  def show
  	@identifier = Identifier.find(params[:id])
    @parent = @identifier.identifiable_type.constantize
    begin   
      @name = @parent.find(@identifier.identifiable_id).name
    rescue
    end
  end


  private

    def identifier_params
      params.require(:identifier).permit(:id, :identifiable_type, :identifiable_id, :name, :value, :rank)
    end
end

