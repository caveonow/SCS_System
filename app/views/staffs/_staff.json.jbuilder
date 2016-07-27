json.extract! staff, :id, :StaffName, :StaffAge, :StaffIC, :StaffEmail, :StaffPassword, :StaffLogAccess, :created_at, :updated_at
json.url staff_url(staff, format: :json)