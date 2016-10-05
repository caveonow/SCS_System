class Answer < ActiveRecord::Base
  belongs_to :subquestion
  belongs_to :question
  has_many :subanswer
  
  

end
