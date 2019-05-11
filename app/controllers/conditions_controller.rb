class ConditionsController < InheritedResources::Base

  private

    def condition_params
      params.require(:condition).permit(:id, :name, :verbiage, :indication, :status, :approved, :change_approved_by, :change_approved_at)
    end
end

