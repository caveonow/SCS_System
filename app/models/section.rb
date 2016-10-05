class Section < ActiveRecord::Base
  belongs_to :form
  has_many :question
end
