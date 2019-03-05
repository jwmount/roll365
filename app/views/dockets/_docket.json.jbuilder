json.extract! docket, :id, :engagement_id, :person_id, :number, :date_worked, :dated, :received_on, :operator_signed, :client_signed, :approved, :approved_on, :approved_by, :a_inv_pay, :b_inv_pay, :supplier_inv_pay, :created_at, :updated_at
json.url docket_url(docket, format: :json)
