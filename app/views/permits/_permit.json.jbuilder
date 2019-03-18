json.extract! permit, :id, :permitable_id, :permitable_type, :name, :description, :issuer, :jurisdiction, :basis, :required, :for_person, :for_company, :for_equipment, :for_location, :permanent, :valid_from, :valid_to, :created_at, :updated_at
json.url permit_url(permit, format: :json)
