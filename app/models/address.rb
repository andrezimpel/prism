class Address < ActiveRecord::Base

  # associations
  belongs_to :account
  belongs_to :client
  belongs_to :order
end
