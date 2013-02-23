class ImageSum < ActiveRecord::Base
  attr_accessible :first_image, :second_image, :equal_to_image

  mount_uploader :first_image,    ImageUploader
  mount_uploader :second_image,   ImageUploader
  mount_uploader :equal_to_image, ImageUploader

  validates :first_image, presence: true
  validates :second_image, presence: true
  validates :equal_to_image, presence: true
end
