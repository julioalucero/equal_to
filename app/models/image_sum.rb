require 'image_processing'

class ImageSum < ActiveRecord::Base
  attr_accessible :first_image, :second_image, :equal_to_image, :equal_to

  mount_uploader :first_image,    ImageUploader
  mount_uploader :second_image,   ImageUploader
  mount_uploader :equal_to_image, ImageUploader
  mount_uploader :equal_to,       EqualUploader

  validates :first_image, presence: true
  validates :second_image, presence: true
  validates :equal_to_image, presence: true

  include ImageProcessing

  after_create :sum_all_images

  def sum_all_images
    first_path  = 'tmp/first.jpg'
    first_geometry = '+30+100'

    second_path = 'tmp/second_path.jpg'
    second_geometry = '+310+100'

    equal_to_path = 'tmp/equal_to_path.jpg'
    equal_to_geometry = '+610+100'

    sum_2_images(self.first_image, 'public/sumatoria.png', first_path, first_geometry)
    sum_2_images(self.second_image, first_path, second_path, second_geometry)
    sum_2_images(self.equal_to_image, second_path, equal_to_path, equal_to_geometry)

    self.equal_to = File.open(equal_to_path)
    self.save!
  end
end

