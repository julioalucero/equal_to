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
    first_sum_path  = 'tmp/first_sum.jpg'
    first_sum_geometry = '+30+100'

    second_sum_path = 'tmp/second_sum_path.jpg'
    second_sum_geometry = '+310+100'

    first_image_result  = sum_2_images(self.first_image, 'public/sumatoria.png', first_sum_path, first_sum_geometry)
    second_image_result = sum_2_images(self.second_image, first_sum_path, second_sum_path, second_sum_geometry)

    self.equal_to = File.open(second_sum_path)
    self.save!
  end
end

