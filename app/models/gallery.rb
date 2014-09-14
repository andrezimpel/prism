class Gallery < ActiveRecord::Base

  #scopes
  default_scope { order('updated_at ASC') }

  has_many :photos
  belongs_to :client, :class_name => 'User'
  belongs_to :post
end
