class CertsController < InheritedResources::Base

  private

    def cert_params
      params.require(:cert).permit(:require_id, :require_type, :certifiable_id, :expires_on, :serial_number, :permanent, :active)
    end
end

