class TipsController  < ApplicationController # < InheritedResources::Base< InheritedResources::Base

  private

    def tip_params
      params.require(:tip).permit(:name, :company_id, :fee, :fire_ant_risk_level)
    end
end

