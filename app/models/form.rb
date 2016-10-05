class Form < ActiveRecord::Base
  belongs_to :user
  has_many :section
  
  has_many :question, through: :section
  has_many :answer, through: :question
  has_many :subquestion, through: :question
  has_many :subanswer, through: :answer
end
