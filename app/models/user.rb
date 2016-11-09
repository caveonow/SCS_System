class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable , :confirmable, :timeoutable, :lockable
  
  has_many :reports      
  belongs_to :role
  belongs_to :faculty
  belongs_to :yearofstudy
  belongs_to :levelofstudy
  belongs_to :programme
  has_many :advertisements
  has_one :welcome
  
  validates_presence_of :name, :faculty_id, :yearofstudy_id, :levelofstudy_id, :programme_id, :age, :DateOfBirth
  validates_uniqueness_of :ICNo, :email
  validates_format_of :ICNo, :with => /\d{2}(0[1-9]|1[012])(0[1-9]|[12]\d|3[01])-\d{2}-\d{4}/, :message => "invalid format"
  before_save :assign_role
  
  #assign role when new user sign up
  def assign_role
    self.role = Role.find_by name: "Student" if self.role.nil?
  end
  
  #def assign_age
  #   source = File.read(Rails.root.join("app/assets/javascripts/c.js"))
  #   context = ExecJS.compile(source)
  #   unless context.call("calculateAge", :DateOfBirth)
  #     errors.add :age, "is an invalid number"
  #end
  #end
  
  def admin?
    self.role.name == "Admin"
  end
  
  def staff?
    self.role.name == "Staff"
  end
  
  def student?
    self.role.name == "Student"
  end
  
  def name=(s)
    write_attribute(:name, s.to_s.titleize) # The to_s is in case you get nil/non-string
  end
  
  
  
end
