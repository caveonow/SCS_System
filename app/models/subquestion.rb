class Subquestion < ActiveRecord::Base
  belongs_to :question
  has_many :answer
end
