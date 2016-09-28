class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable 
  belongs_to :role
  has_many :advertisements
  
  validates_presence_of :name,:ICNo,:age,:programme
  validates_uniqueness_of :ICNo
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
  
  #import CVS & Excel
  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      user = find_by_id(row["id"]) || new
      user.attributes = row.to_hash.slice(*accessible_attributes)
      user.save!
    end
  end
  
  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Csv.new(file.path, nil, :ignore)
    when ".xls" then Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
