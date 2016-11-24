class Form < ActiveRecord::Base
  belongs_to :user
  has_many :formassociates
  has_many :section, :dependent => :destroy
  
  has_many :question, through: :section
  has_many :answer, through: :question
  
  has_many :studanswer, through: :answer
  
  validates_presence_of :FormName, :FormDescription
end
