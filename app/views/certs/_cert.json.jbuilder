json.extract! cert, :id, :require_id, :require_type, :certifiable_id, :expires_on, :serial_number, :permanent, :active, :created_at, :updated_at
json.url cert_url(cert, format: :json)
