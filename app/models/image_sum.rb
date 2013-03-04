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

  FIRST_GEOMETRY    =  '+30+60'
  SECOND_GEOMETRY   = '+390+60'
  EQUAL_TO_GEOMETRY = '+750+60'

  TEMPLATE_IMAGE = 'public/sumatoria.png'

  def sum_all_images
    first_path    = 'tmp/first.jpg'
    second_path   = 'tmp/second_path.jpg'
    equal_to_path = 'tmp/equal_to_path.jpg'

    sum_2_images(self.first_image,    TEMPLATE_IMAGE, first_path,    FIRST_GEOMETRY)
    sum_2_images(self.second_image,   first_path,     second_path,   SECOND_GEOMETRY)
    sum_2_images(self.equal_to_image, second_path,    equal_to_path, EQUAL_TO_GEOMETRY)

    self.equal_to = File.open(equal_to_path)
    self.save!
  end
end

