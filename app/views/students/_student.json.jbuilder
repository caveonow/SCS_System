json.extract! student, :id, :StudentName, :StudentIC, :StudentAge, :StudentProgramme, :StudentEmail, :StudentLogAccess, :created_at, :updated_at
json.url student_url(student, format: :json)