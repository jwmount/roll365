json.extract! shipment, :id, :ship_from, :ship_to, :pickup, :deliver, :body, :quote_basis, :quote_complete, :tracking_id, :created_at, :updated_at
json.url shipment_url(shipment, format: :json)
