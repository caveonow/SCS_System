class UserImport < ActiveRecord::Base
  belongs_to :role
  belongs_to :faculty
  belongs_to :yearofstudy
  belongs_to :levelofstudy
  belongs_to :programme
  
  include ActiveModel::Model
  attr_accessor :file
  validates_inclusion_of :file, :in => %w( csv ), :message => "extension %s is not included in the list"

  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end

  def save
    if imported_users.map(&:valid?).all?
      imported_users.each(&:save!)
      true
    else
      imported_users.each_with_index do |user, index|
        user.errors.full_messages.each do |message|
          errors.add :base, "Row #{index+2}: #{message}"
        end
      end
      false
    end
  end

  def imported_users
    @imported_users ||= load_imported_users
  end

  def load_imported_users
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      user = User.find_by(id: row["id"]) || User.new
      user.attributes = row.to_hash
      user
    end    
  end

end