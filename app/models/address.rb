class Address < ActiveRecord::Base

  # associations
  belongs_to :account
  belongs_to :client
  belongs_to :order

  validates :firstname, :lastname, :street, :city, :zipcode, presence: true
  validates :phone, :state, presence: false

  phony_normalize :phone, :default_country_code => 'DE'
end
