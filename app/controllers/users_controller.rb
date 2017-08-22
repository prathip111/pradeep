class UsersController < ApplicationController
  
  def index
    @user = User.new
  end

  def register
    
    @user = User.create(name: params[:name], password: params[:password])
    redirect_to action: "login" 
  end


  def login
  
  end

  def user_login

    user = User.auth(params[:name],params[:password])
    if user
    
 # 	if @user = Register.find_by(email: params[:email], passord: params[:password])
      session[:user_id] = user.id
			redirect_to  photos_new_path
		else
			redirect_to action: "login"

		end
  end
  def commants

    @cmd = Comment.where(photo_id: params[:format],status: 0)

  end
  def accept

     @cmd = Comment.find(params[:format])

     if @cmd.update(status: 1)
      redirect_to users_commants_path(@cmd.photo_id)
     end
  end
end

