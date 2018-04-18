# client
class Client < ActiveRecord::Base
  has_many :client_contacts
  accepts_nested_attributes_for :client_contacts

  validates :organization_name, presence: true, length: { minimum: 5 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :business_phone, presence: true,numericality: true,length: { minimum: 10, maximum: 12 }
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :mobile, presence: true,numericality: true, length: { minimum: 10, maximum: 12 }
  validates :available_credit_amount, presence: true
  validates :company, presence: true
  validates :country, presence: true
  validates :currency, presence: true
  validates :street_first, presence: true
  validates :street_second, presence: true
  validates :city, presence: true
  validates :state, presence: true
  zip_regex_usa = /\d{5}(-\d{4})?/
  validates :pincode, presence: true, format: { with: zip_regex_usa }
  validates :industry, presence: true
  validates :companysize, presence: true
  validates :fax, presence: true
  validates :internal_notes, presence: true
end
