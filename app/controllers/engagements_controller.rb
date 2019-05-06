class EngagementsController < InheritedResources::Base


  # @q is a relation
  # @companies = returns a collection, we sort and paginate based on that
  def index
    redirect_to engagement_path(:id)
    #@q = Engagement.ransack(params[:q])
    #@engagements = @q.result.order(name: 'ASC').paginate(page: params[:page], per_page: 10 || params[:per_page])
  end

  
  private

    def engagement_params
      params.require(:engagement).permit(:schedule_id, :person_id, :docket_id, :docket_number, :onsite_now, :onsite_at, :breakdown, :no_show, :OK_tomorrow, :engagement_declined)
    end
end

