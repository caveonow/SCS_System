json.extract! user, :id, :Name, :ICNumber, :Age, :Programme, :passwrod_digest, :Email, :LogAccess, :Role, :created_at, :updated_at
json.url user_url(user, format: :json)