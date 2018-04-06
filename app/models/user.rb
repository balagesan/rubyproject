class User < ActiveRecord::Base
	before_create :confirmation_token
	validates :username, presence: true, length: { minimum: 5 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
	# ,uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 6 }
	validates :password,presence: true, length: { maximum: 10 }
	validates :confirmpwd, presence: true, length: { maximum: 10 }
	
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
