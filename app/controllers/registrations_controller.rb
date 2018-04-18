class RegistrationsController < ApplicationController
  def new; end

  def signup
    @user = User.new(username: params[:username], email: params[:email], password: params[:password], confirmpwd: params[:confirmpwd])
    if @user.save
      UserMailer.registration_confirmation(@user).deliver_now
      flash[:success] = 'Please confirm your email address to continue'
      redirect_to '/sessions/new'
    else
      errors = @user.errors.full_messages
      flash[:notice] = errors
      render action: 'new'
    end
  end

  private

  def set_registration
    @user = User.find(params[:id])
  end

  def registration_params
    params.require(:user).permit(:username, :email, :password, :confirmpwd)
  end
end
