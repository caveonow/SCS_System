json.extract! question, :id, :QuestionDesc, :QuestionNumber, :isSubQuestion, :section_id, :created_at, :updated_at
json.url question_url(question, format: :json)