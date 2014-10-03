class Account < ActiveRecord::Base

  # associations
  has_many :users, dependent: :destroy
  has_many :clients, dependent: :destroy
  has_many :galleries, dependent: :destroy
  has_many :photos, :through => :galleries
  has_many :posts, dependent: :destroy
  has_many :photo_sizes, dependent: :destroy
  has_many :orders, dependent: :destroy

  accepts_nested_attributes_for :users

  # validations
  validates :title, presence: true, uniqueness: true
  validates :subdomain, presence: true, uniqueness: true
end
