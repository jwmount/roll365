json.extract! certificate, :id, :name, :description, :for_person, :for_company, :for_equipment, :for_location, :active, :created_at, :updated_at
json.url certificate_url(certificate, format: :json)
