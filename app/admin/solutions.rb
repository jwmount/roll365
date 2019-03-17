ActiveAdmin.register Solution do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params    :approved, :client_approved, :drive_time_from_load_to_tip, :drive_time_into_site, :drive_time_into_tip,
                   :drive_time_out_of_site, :drive_time_out_of_tip_site, :drive_time_tip_to_load, :equipment_name, :equipment_dollars_per_day,
                   :equipment_units_required_per_day, :hourly_hire_rate, :invoice_load_client, :invoice_tip_client, 
                   :kms_one_way, :load_time, :loads_per_day, :loads_per_day, :material_id, 
                   :name,
                   :pay_equipment_per_unit, :pay_equipment_per_unit, :pay_equipment_per_unit, :pay_load_client, :pay_tip_client, :pay_tip,  :pay_tolls,
                   :purchase_order_required, :purchase_order_required, :quote_id, :solution_type, :semis_permitted, :total_material, 
                   :unit_of_material, :unload_time
end
