json.extract! job, :id, :solution_id, :start_on, :time, :name, :finished_on, :purchase_order, :active, :complete, :created_at, :updated_at
json.url job_url(job, format: :json)
