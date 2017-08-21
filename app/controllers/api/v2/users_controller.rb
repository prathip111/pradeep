module Api
  module V1

class UsersController < ApplicationController
  #skip_before_action :check_session
  #skip_before_action :verify_authenticity_token

 def index
    @user = User.new
  end

  def register
    
    @user = User.create(name: params[:name], password: params[:password])
    render json: @user 
  end


  def login
  
  end

  def user_login

    user = User.auth(params[:name],params[:password])
    if user
    
 #  if @user = Register.find_by(email: params[:email], passord: params[:password])
      session[:user_id] = user.id
      redirect_to  photos_new_path
    else
      redirect_to action: "login"

    end
  end
end

end
end