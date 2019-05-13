class ConditionsController  < ApplicationController # < InheritedResources::Base< InheritedResources::Base

  def index
  	render inline: "Hang on there while the actions get defined, apparently they were all in ActiveAdmin"
  end

  private

    def condition_params
      params.require(:condition).permit(:name, :verbiage, :indication, :status, :approved, :change_approved_by, :change_approved_at)
    end
end

