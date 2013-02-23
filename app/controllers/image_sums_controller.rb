class ImageSumsController < ApplicationController
  def new
    @image_sum = ImageSum.new
  end

  def create
    binding.pry
  end
end
