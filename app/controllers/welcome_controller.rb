class WelcomeController < ApplicationController
  
  def index
    #@welcome = Welcome.includes(:bannerslide).all  
    @welcomeBs = Bannerslide.where(:statusBs => 'active')
    @welcomeCount = Bannerslide.where(:statusBs => 'active').count
    
    
    @signoutAd = Advertisement.where(:statusAd => 'active')
    @welcomeAd = Advertisement.first
    @welcomeAd1 = Advertisement.all.offset(1)
    @AdvertAsso = Advertisementassociate.all
    

    if (user_signed_in?)
      @checkuser = current_user
      @checkadverdcount = Advertisementassociate.where(:yearofstudy => [@checkuser.yearofstudy_id,1],
                      :faculty_id => [@checkuser.faculty_id,1], :programme_id => [@checkuser.programme_id,1], 
                      :levelofstudy => [@checkuser.levelofstudy_id,1]).count
      @checkadverd = Advertisementassociate.where(:yearofstudy => [@checkuser.yearofstudy_id,1],
                      :faculty_id => [@checkuser.faculty_id,1], :programme_id => [@checkuser.programme_id,1], 
                      :levelofstudy => [@checkuser.levelofstudy_id,1])
    end
    
    @welcome = current_user
    
    
  end

end
