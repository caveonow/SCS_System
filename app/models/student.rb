class Student < ActiveRecord::Base
  has_secure_password
  
  def student? 
  self.role == 'student' 
  end

  def admin? 
  self.role == 'admin' 
  end

end
