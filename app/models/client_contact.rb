# clientcontact
class ClientContact < ActiveRecord::Base
  belongs_to :client
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :contact_email, presence: true,format: { with: VALID_EMAIL_REGEX }
  validates :contact_phone, presence: true,numericality: true,length: { minimum: 10,maximum: 12 }
  validates :contact_name, presence: true
  validates :contact_mobile, presence: true,numericality: true,length: { minimum: 10, maximum: 12 }
end
