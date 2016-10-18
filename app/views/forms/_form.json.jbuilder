json.extract! form, :id, :FormName, :FormDescription, :FormDateTime, :FormStatus, :user_id, :created_at, :updated_at
json.url form_url(form, format: :json)