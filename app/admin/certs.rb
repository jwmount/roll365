ActiveAdmin.register Cert do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :expires_on, :serial_number, :permanent, :active, :list, :of, :attributes, :on, :model

end
