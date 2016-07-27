json.extract! question, :id, :QuestionDesc, :QuestionNumber, :isSubQuestion, :created_at, :updated_at
json.url question_url(question, format: :json)