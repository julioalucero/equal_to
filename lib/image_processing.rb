module ImageProcessing

  def sum_2_images(image_one, image_two, result_path, geometry)
    first_image = MiniMagick::Image.open(image_one.current_path)
    equal_to = MiniMagick::Image.open(image_two)

    result = equal_to.composite(first_image) do |i|
      i.compose 'atop'
      i.geometry geometry
    end

    result.write result_path
    result
  end
end
