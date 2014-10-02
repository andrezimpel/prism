class PhotoPhotoSize < ActiveRecord::Base

  # associations
  belongs_to :photo
  belongs_to :photo_size
end
