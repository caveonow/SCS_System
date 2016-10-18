json.extract! user, :id, :name, :age, :ICNo, :programme , :role_id, :created_at, :updated_at
json.url user_url(user, format: :json)