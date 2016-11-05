class Studanswer < ActiveRecord::Base
  belongs_to :formanswer
  belongs_to :answer
end
