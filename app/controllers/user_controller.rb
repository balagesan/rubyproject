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


 # def create
 #    @user = User.new(user_params)    
 #    if @user.save
 #      UserMailer.registration_confirmation(@user).deliver
 #      flash[:success] = "Please confirm your email address to continue"
 #      redirect_to root_url
 #    else
 #      flash[:error] = "Ooooppss, something went wrong!"
 #      render 'new'
 #    end
 #  end
  
  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:success] = "Welcome to the Sample App! Your email has been confirmed.
      Please sign in to continue."
      redirect_to '/sessions/new'
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to root_url
    end
  end
 

  private
    def set_user
      @user = User.find(params[:id])
      Rails.logger.debug "set_user@@@@@@@: #{@user.inspect}"
    end

    def user_params
	   params.require(:user).permit(:username,:email,:password,:confirmpwd)
	  end
end
