class Section < ActiveRecord::Base
  belongs_to :form
  has_many :question
  
  has_many :answer, through: :question
  has_many :subanswer, through: :answer
  has_many :subquestion, through: :answer
  has_many :subquestionanswer, through: :subquestion
  
  
  
  validates_presence_of :SectionName, :SectionDescription, :form_id
end
