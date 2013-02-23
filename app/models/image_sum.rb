class ImageSum < ActiveRecord::Base
  attr_accessible :equal_to_image, :first_image, :second_image

  mount_uploader :first_image,    ImageUploader
  mount_uploader :second_image,   ImageUploader
  mount_uploader :equal_to_image, ImageUploader
end
