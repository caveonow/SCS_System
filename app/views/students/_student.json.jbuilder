json.extract! student, :id, :StudentName, :StudentIC, :StudentAge, :StudentProgramme, :StudentEmail, :StudentLogAccess, :role, :created_at, :updated_at
json.url student_url(student, format: :json)