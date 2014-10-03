class Gallery < ActiveRecord::Base

  #scopes
  default_scope { order('updated_at ASC') }

  # filter
  scope :has_no_client, lambda { where(['client_id IS NULL']) }
  scope :portfolio, lambda { where(['portfolio IS NOT NULL']) }

  # associations
  has_many :photos, dependent: :destroy
  belongs_to :client
  belongs_to :post
  belongs_to :account
end
