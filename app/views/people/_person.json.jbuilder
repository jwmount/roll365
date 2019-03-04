json.extract! person, :id, :company_id, :first_name, :last_name, :title, :available, :available_on, :OK_to_contact, :active, :created_at, :updated_at
json.url person_url(person, format: :json)
