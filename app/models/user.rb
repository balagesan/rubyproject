class User < ActiveRecord::Base
	validates :username, presence: true
	validates :password, length: { maximum: 8 }
end
