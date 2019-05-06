class PermitsController < InheritedResources::Base

  def index
  	@parent = Company.find(params[:company_id])
  	@permits = @parent.permits
  end
  #
  # No direct operation is allowed, must be from an -able parent
  #
  def new
    if params.key?("company_id")
      @parent = Company.find(params[:company_id])
      @permit = @parent.permit.new
      @permit.save!
    else
      @permit = Permit.new
      @permit.permitable_type = 'Compay'
      @permit.permitable_id = ''
    redirect_to :index
  end


  private

    def permit_params
      params.require(:permit).permit(:id, :permitable_id, :permitable_type, :name, :description, :issuer, :jurisdiction, :basis, :required, 
        :for_person, :for_company, :for_equipment, :for_location, :permanent, :valid_from, :valid_to)
    end
end

