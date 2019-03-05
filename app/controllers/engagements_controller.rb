class EngagementsController < InheritedResources::Base

  private

    def engagement_params
      params.require(:engagement).permit(:schedule_id, :person_id, :docket_id, :docket_number, :onsite_now, :onsite_at, :breakdown, :no_show, :OK_tomorrow, :engagement_declined)
    end
end

