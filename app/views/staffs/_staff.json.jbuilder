json.extract! staff, :id, :StaffName, :StaffIC, :StaffAge, :StaffEmail, :StaffLogAccess, :created_at, :updated_at
json.url staff_url(staff, format: :json)