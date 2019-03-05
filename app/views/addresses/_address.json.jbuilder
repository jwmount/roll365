json.extract! address, :id, :company_id, :company_type, :street{30}, :city{30}, :state{2}, :post_code{10}, :map_reference, :latitude, :longitude, :created_at, :updated_at
json.url address_url(address, format: :json)
