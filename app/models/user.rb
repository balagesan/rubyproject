class User < ActiveRecord::Base
  include ActiveModel::Validations
  validates :username, presence: true
  validates :username, length: { minimum: 5 }
  attr_accessible :email,:username
  validates :email, :presence => true, :uniqueness => true, :email => true  
end
