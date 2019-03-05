class ProjectsController < InheritedResources::Base

  private

    def project_params
      params.require(:project).permit(:name, :company_id, :rep_id, :project_start_on, :description, :active, :intends_to_bid, :submitted_bid)
    end
end

