class TrialsController < InheritedResources::Base

  private

    def trial_params
      params.require(:trial).permit(:trialable_id, :trialable_type, :company_id, :company_type, :person_id, :person_type, :name, :description)
    end
end

