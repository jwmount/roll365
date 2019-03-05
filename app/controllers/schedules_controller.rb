class SchedulesController < InheritedResources::Base

  private

    def schedule_params
      params.require(:schedule).permit(:day, :job_id, :equipment_units_today)
    end
end

