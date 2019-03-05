class PeopleSchedulesController < InheritedResources::Base

  private

    def people_schedule_params
      params.require(:people_schedule).permit(:person_id, :schedule_id)
    end
end

