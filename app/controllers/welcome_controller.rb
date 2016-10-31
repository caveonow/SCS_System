class WelcomeController < ApplicationController
  
  def index
    #@welcome = Welcome.includes(:bannerslide).all  
    @welcomeBs = Bannerslide.where(:statusBs => 'active')
    @welcomeCount = Bannerslide.where(:statusBs => 'active').count
    
    
    @signoutAd = Advertisement.where(:statusAd => 'active')
    @welcomeAd = Advertisement.first
    @welcomeAd1 = Advertisement.all
    @AdvertAsso = Advertisementassociate.all
    @AdvertAssoAge = Advertisementassociate.where("agefrom=?", 12)
    

    if (user_signed_in?)
      @checkuser = current_user
      @checkadverdcount = Advertisementassociate.where(:yearofstudy => [@checkuser.yearofstudy_id,1],
                      :faculty_id => [@checkuser.faculty_id,1], :programme_id => [@checkuser.programme_id,1], 
                      :levelofstudy => [@checkuser.levelofstudy_id,1]).count
      @checkadverd     = Advertisementassociate.where(:yearofstudy => [@checkuser.yearofstudy_id,1],
                      :faculty_id => [@checkuser.faculty_id,1], :programme_id => [@checkuser.programme_id,1], 
                      :levelofstudy => [@checkuser.levelofstudy_id,1])
      @checkadverdfirst = Advertisementassociate.where(:yearofstudy => [@checkuser.yearofstudy_id,1],
                      :faculty_id => [@checkuser.faculty_id,1], :programme_id => [@checkuser.programme_id,1], 
                      :levelofstudy => [@checkuser.levelofstudy_id,1]).first
      @checkadverdsecond = Advertisementassociate.where(:yearofstudy => [@checkuser.yearofstudy_id,1],
                      :faculty_id => [@checkuser.faculty_id,1], :programme_id => [@checkuser.programme_id,1], 
                      :levelofstudy => [@checkuser.levelofstudy_id,1]).offset(1) 

      
      @checkadverdfirsttest = Advertisementassociate.where(:yearofstudy => [@checkuser.yearofstudy_id,1],
                                :faculty_id => [@checkuser.faculty_id,1], :programme_id => [@checkuser.programme_id,1], 
                                :levelofstudy => [@checkuser.levelofstudy_id,1],:agefrom => [current_user.age], :agecondition => ['Equal'])
      @checkadverdfirsttest1 = Advertisementassociate.where("agefrom < ? AND agecondition = ? AND yearofstudy_id = ? AND faculty_id = ? AND programme_id = ? AND levelofstudy_id =?",
                                 @checkuser.age ,"More Than" ,[@checkuser.yearofstudy_id || "1"],[@checkuser.faculty_id || "1"],[@checkuser.programme_id || "1"],
                                 [@checkuser.levelofstudy_id || "1"]) 
      @checkadverdfirsttest2 = Advertisementassociate.where("agefrom > ? AND agecondition = ? AND yearofstudy_id = ? AND faculty_id = ? AND programme_id = ? AND levelofstudy_id =?",
                                 @checkuser.age ,"Less Than" ,[@checkuser.yearofstudy_id || "1"],[@checkuser.faculty_id || "1"],[@checkuser.programme_id || "1"],
                                 [@checkuser.levelofstudy_id || "1"]) 
      @checkadverdfirsttest3 = Advertisementassociate.where("agefrom <= ? AND ageto >= ? AND agecondition = ? AND yearofstudy_id = ? AND faculty_id = ? AND programme_id = ? AND levelofstudy_id =?",
                                 @checkuser.age,@checkuser.age ,"Between",[@checkuser.yearofstudy_id || "1"],[@checkuser.faculty_id || "1"],[@checkuser.programme_id || "1"],
                                 [@checkuser.levelofstudy_id || "1"])                             
                      
      @firstcheckadverd = @checkadverd.first
      @secondcheckadverd = @checkadverd.offset(1)         
    end
    
    @welcome = current_user
    
    
  end

end
