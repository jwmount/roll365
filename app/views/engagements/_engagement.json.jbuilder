json.extract! engagement, :id, :schedule_id, :person_id, :docket_id, :docket_number, :onsite_now, :onsite_at, :breakdown, :no_show, :OK_tomorrow, :engagement_declined, :created_at, :updated_at
json.url engagement_url(engagement, format: :json)
