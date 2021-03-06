class UsersController < ApplicationController
  before_filter :authenticate_user!
  #before_action :set_user, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
      @joined_on = @user.created_at.to_formatted_s(:short)
    if @user.current_sign_in_at
      @last_login = @user.current_sign_in_at.to_formatted_s(:short)
    else
      @last_login = "never"
    end
  end

  # GET /users/new
  def new
    #@user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    
    if user_params[:password].blank? && user_params[:password_confirmation].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end
    
    successfully_updated =  if needs_password?(@user, user_params)
                              @user.update(user_params)
                            else
                              @user.update_without_password(user_params)
                            end
    
    respond_to do |format|
      if successfully_updated
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def editmuluser
    if params[:user_ids].nil?
      redirect_to users_url
      flash[:success] = "Please select a field"
    else
      @useredits = User.find(params[:user_ids])
    end
  end
  
  def updatemuluser
   # @translators = Translator.update(params[:translator].keys, params[:translator].values).reject { |p| p.errors.empty? }
   #if @translators.empty?  
   @useredits = User.find(params[:user_ids]) 
   if params[:update]
     @useredits.reject! do |user|
       user.update_attributes(update_user_params.reject {|k,v| v.blank?})
       user.save
       flash[:success] = "Profile updated"
     end
        redirect_to users_url 
   else
     @useredits = User.find(params[:user_ids])
     @useredits.reject! do |user|
       user.destroy   
     end 
     redirect_to users_url 
   end  
  end
  
  protected
  def needs_password?(user, params)
      params[:password].present?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_user
    #  @user = User.find(params[:id])
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :ICNo , :role_id, :faculty_id, :programme_id, :yearofstudy_id ,:DateOfBirth ,:gender, :age)
    end
    
    def needs_password?(user, params)
      params[:password].present?
    end
    
    def update_user_params
      params.require(:user).permit! if params[:user]
    end
end
