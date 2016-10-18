json.extract! subanswer, :id, :SubAnswerDesc, :SubAnswerCount, :answer_id, :created_at, :updated_at
json.url subanswer_url(subanswer, format: :json)