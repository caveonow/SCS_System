class Formassociate < ActiveRecord::Base
  belongs_to :form
  belongs_to :yearofstudy
  belongs_to :levelofstudy
  belongs_to :faculty
  belongs_to :programme
  
  
  validates_presence_of :faculty_id, :yearofstudy_id, :levelofstudy_id, :programme_id, :form_id
end
