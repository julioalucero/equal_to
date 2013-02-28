class AddEqualToToImageSum < ActiveRecord::Migration
  def change
    add_column :image_sums, :equal_to, :string
  end
end
