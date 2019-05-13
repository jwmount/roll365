class ConditionsController  < ApplicationController # < InheritedResources::Base< InheritedResources::Base


  private

    def condition_params
      params.require(:condition).permit(:name, :verbiage, :indication, :status, :approved, :change_approved_by, :change_approved_at)
    end
end

