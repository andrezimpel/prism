class Photo < ActiveRecord::Base

  belongs_to :gallery

  # paperclip
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>", :medium_s => "300x300#" }, :default_url => "/assets/missing.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  # get filename or title
  def fullname
    # return title if available
    return self.title unless self.title == nil

    # return image_file_name
    return self.image_file_name
  end
end
