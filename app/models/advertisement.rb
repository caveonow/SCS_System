class Advertisement < ActiveRecord::Base
   def advertisement_params
      params.require(:advertisement).permit()
    end

   mount_uploader :image, ImageUploader

end
