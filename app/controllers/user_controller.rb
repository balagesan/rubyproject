class UserController < ApplicationController
  def index
  end
  def signup
  end

  def signuppage
    user = User.new(username: params[:username],email: params[:email],password: params[:password],confirmpwd: params[:confirmpwd])
    if params[:confirmpwd] != params[:password]
      message = "Your passwords don't match!"
    elsif user.save
      message = "Your account has been created!"
    else
      message = "Your account couldn't be created. Did you enter a unique username and password?"
    end
    puts message
    redirect_to action: :login
  end


  def login

  end

  def loginpage
    @user = User.find_by(username: params[:username])
    Rails.logger.debug "loginpage: #{@user.inspect}"
    # if !@user
    #   flash[:notice] = "This user doesn't exist!"
    # elsif @user.password != params[:password]
    #   flash[:notice] = "Your password's wrong!"
    # else
    #   flash[:notice] = "You're signed in, #{@user.username}!"
    # end

    if !@user.blank? && params[:password] == @user.password
       redirect_to action: :logout
    else
      render action: login
    end

    
  end


  def logout
    puts "You are logout sucessfully"
  end

  def create
    @user = User.new(user_params)
    user = @user.save
    Rails.logger.debug "USer: #{user.inspect}"
  end

  private
    def user_params
	   params.require(:user).permit(:username,:email, :password,:confirmpwd)
	  end
end
