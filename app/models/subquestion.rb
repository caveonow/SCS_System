class Subquestion < ActiveRecord::Base
  belongs_to :question
  has_many :answer
  
  has_many :subanswer, through: :answer
end
