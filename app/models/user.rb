class User < ActiveRecord::Base
	before_create :confirmation_token
	validates :username, presence: true
	validates :email, presence: true
	validates :password, length: { minimum: 6 }
	validates :password,presence: true, length: { maximum: 10 }
	validates :confirmpwd, presence: true
	
	private
	  def confirmation_token
	    if self.confirm_token.blank?
	      self.confirm_token = SecureRandom.urlsafe_base64.to_s
	    end
	  end

	  def email_activate
        self.email_confirmed = true
        self.confirm_token = nil
         save!(:validate => false)
      end

end
