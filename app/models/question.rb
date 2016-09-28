class Question < ActiveRecord::Base
  belongs_to :section
  has_many :answer
  has_many :subquestion
end
