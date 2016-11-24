class Section < ActiveRecord::Base
  belongs_to :form
  has_many :question, :dependent => :destroy
  
  has_many :answer, through: :question
  
  has_many :studanswer, through: :answer
  
  validates_presence_of :SectionName, :SectionDescription, :form_id
end
