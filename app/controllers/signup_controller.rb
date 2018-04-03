class SignupController < ApplicationController
  def index
    @signup = Signup.all
  end

  def new
  	@signup = Signup.new
  end

  def show
  end
  
  def create
    p 'Hellooooooooo-----------'
    @signup = Signup.new(signup_params)
    Rails.logger.debug "Signup--user: #{@signup.inspect}"
    user = @signup.save
    Rails.logger.debug "USer: #{user.inspect}"
	  # if @signup.save
	  #   redirect_to 'show'
   #  else
   #    render 'new'
   #  end
  end

  private
    def signup_params
	   params.require(:signup).permit(:username, :password,:confirmpwd)
	  end

end
