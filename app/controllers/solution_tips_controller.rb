class SolutionTipsController < InheritedResources::Base

  private

    def solution_tip_params
      params.require(:solution_tip).permit(:solution_id, :tip_id)
    end
end

