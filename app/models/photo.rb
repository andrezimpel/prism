class Photo < ActiveRecord::Base

  # associations
  belongs_to :gallery

  # order
  default_scope { order('created_at DESC', 'updated_at DESC') }

  # paperclip
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>", :medium_s => "300x300#" }, :default_url => "/assets/missing.jpg"
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
