json.extract! studanswer, :id, :StudentAnswer, :formanswer_id, :created_at, :updated_at
json.url studanswer_url(studanswer, format: :json)