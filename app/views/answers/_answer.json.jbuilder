json.extract! answer, :id, :AnswerDesc, :isSubAnswer, :AnswerCount, :created_at, :updated_at
json.url answer_url(answer, format: :json)