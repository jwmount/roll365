json.extract! reservation, :id, :schedule_id, :equipment_id, :number_requested, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
