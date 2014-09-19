class Account < ActiveRecord::Base

  has_many :users
  has_many :galleries
  has_many :photos, :through => :galleries
  has_many :posts

  accepts_nested_attributes_for :users

  # validations
  validates :title, presence: true, uniqueness: true
  validates :subdomain, presence: true, uniqueness: true
end
