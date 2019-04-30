class IdentifiersController < InheritedResources::Base


  def index
    @identifiers = Identifier.order(name: :asc).page params[:page]
  end

  def parent_index
    @ids = Identifier.where(:identifiable_id => params[:format]).order(name: 'ASC', rank: 'DESC').page params[:page]
    @identifiers = @ids.order(rank: 'DESC')
    render "index"
  end

  
  #
  # No direct operation is allowed, must be from an addressable parent
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


  private

    def identifier_params
      params.require(:identifier).permit(:id, :identifiable_type, :identifiable_id, :name, :value, :rank)
    end
end

