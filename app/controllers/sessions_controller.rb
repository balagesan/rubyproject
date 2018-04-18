class SessionsController < ApplicationController
  def new; end

  def authenticate
    @user = User.find_by(username: params[:username], password: params[:password])
    Rails.logger.debug "authenticate: #{@user.inspect}"

    if @user.blank?
      flash[:notice] = "Username and Password can't be blank or match"
      render action: 'new'
    elsif !@user.blank? && params[:username] == @user.username && params[:password] == @user.password
      # flash[:success] = "Login Sucessfully"
      redirect_to '/sessions/landing_page'
    else
      flash[:notice] = 'Invalid username or password.'
      render action: 'new'
    end
  end

  def create
    user = User.find_by_email(params[:email].downcase)
    if user && user.authenticate(params[:password])
      if user.email_confirmed
        sign_in user
        redirect_back_or user
      else
        flash.now[:error] = 'Please activate your account by following the
        instructions in the account confirmation email you received to proceed'
        render 'new'
      end
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def landing_page
    puts 'sucess'
  end

  private

  def set_session
    @user = User.find(params[:id])
  end

  def session_params
    params.require(:user).permit(:username, :email, :password, :confirmpwd)
  end
end
