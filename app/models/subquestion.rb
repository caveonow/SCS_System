class Subquestion < ActiveRecord::Base
  belongs_to :answer
  has_many :subquestionanswer, :dependent => :destroy
  
end
