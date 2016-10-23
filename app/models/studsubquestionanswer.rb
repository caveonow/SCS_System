class Studsubquestionanswer < ActiveRecord::Base
  belongs_to :subquestionanswer
  belongs_to :formanswer
end
