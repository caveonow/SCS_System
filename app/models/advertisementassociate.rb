class Advertisementassociate < ActiveRecord::Base
  belongs_to :faculty
  belongs_to :levelofstudy
  belongs_to :programme
  belongs_to :advertisement
  belongs_to :yearofstudy
  
  validates_presence_of :faculty_id, :yearofstudy_id, :levelofstudy_id, :programme_id, :advertisement_id
  
end
