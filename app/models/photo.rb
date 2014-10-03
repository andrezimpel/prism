class Photo < ActiveRecord::Base

  # associations
  belongs_to :gallery
  belongs_to :shopping_cart_item

  has_many :photo_photo_sizes
  has_many :photo_sizes, through: :photo_photo_sizes

  has_many :shopping_cart_items, through: :photo_sizes

  # order
  default_scope { order('id DESC', 'updated_at DESC') }

  # paperclip
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>", :medium_s => "300x300#", :thumb_s => "100x100#" }, :default_url => "/assets/missing.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  # get filename or title
  def fullname
    # return title if available
    return self.title unless self.title == nil

    # return image_file_name
    return File.basename(self.image_file_name, '.*').titleize
  end

  # after_save :set_title
  # def set_title
  #   self.title = File.basename(self.image_file_name, '.*').titleize
  #   self.save!
  # end
end
