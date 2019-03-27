class QuotesController < InheritedResources::Base

  private

    def quote_params
      params.require(:quote).permit(:project_id, :quote_to_id, :rep_id, :name, :fire_ants, :fire_ants_verified_by, :inclusions, :expected_start, :duration, :council)
    end
end

