class ImageSumsController < ApplicationController

  def new
    @image_sum = ImageSum.new
  end

  def create
    @image_sum = ImageSum.new(params[:image_sum])

    if @image_sum.save
      redirect_to image_sum_path(@image_sum), notice: "Share your Image."
    else
      render :new
    end
  end

  def show
    @image_sum = ImageSum.find(params[:id])
  end
end
