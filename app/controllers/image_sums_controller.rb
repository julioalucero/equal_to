class ImageSumsController < ApplicationController
  def new
    @image_sum = ImageSum.new
  end

  def create
    @image_sum = ImageSum.new(params[:image_sum])

    if @image_sum.save
      redirect_to '/'
    else
      render :new
    end
  end
end
