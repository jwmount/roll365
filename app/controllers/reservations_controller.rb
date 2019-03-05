class ReservationsController < InheritedResources::Base

  private

    def reservation_params
      params.require(:reservation).permit(:schedule_id, :equipment_id, :number_requested)
    end
end

