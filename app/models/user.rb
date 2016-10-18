class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable , :confirmable, :timeoutable
         
  belongs_to :role
  has_many :advertisements
  
  validates_presence_of :name
  validates_uniqueness_of :ICNo, :email
  validates :age, :numericality => { :only_integer => true}
  validates_format_of :ICNo, :with => /\d{2}(0[1-9]|1[012])(0[1-9]|[12]\d|3[01])-\d{2}-\d{4}/
  before_save :assign_role
  
  #assign role when new user sign up
  def assign_role
    self.role = Role.find_by name: "Student" if self.role.nil?
  end
  
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
