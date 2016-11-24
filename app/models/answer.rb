class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :studanswer,  :dependent => :destroy

  validates_presence_of :AnswerDesc, :AnswerCount
end
