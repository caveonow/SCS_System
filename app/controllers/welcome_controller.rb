class WelcomeController < ApplicationController
  def index
    #@welcome = Welcome.includes(:bannerslide).all  
    @welcomeBs = Bannerslide.where(:statusBs => 'active')
    @welcomeCount = Bannerslide.where(:statusBs => 'active').count
    
    @welcomeAd = Advertisement.where(:statusAd => 'active')
  end

end
