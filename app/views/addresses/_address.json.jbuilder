json.extract! address, :id, :street_address,, :city,, :state,, :post_code, :map_reference, :longitude, :latitude, :company_id, :company_type, :person_id, :person_type, :identifier_id, :identifier_type, :cert_id, :cert_type, :requirement_id, :requirement_type, :created_at, :updated_at
json.url address_url(address, format: :json)
