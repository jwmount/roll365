ActiveAdmin.register Job do

  permit_params  :start_on, :time, :name, :finished_on, :purchase_order, :active, :complete

end
