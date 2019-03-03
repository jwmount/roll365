json.extract! company, :id, :name, :credit_terms, :PO_required, :active, :bookkeeping_number, :line_of_business, :url, :licensee, :created_at, :updated_at
json.url company_url(company, format: :json)
