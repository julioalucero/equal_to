class CreateImageSums < ActiveRecord::Migration
  def change
    create_table :image_sums do |t|
      t.string :first_image
      t.string :second_image
      t.string :equal_to_image

      t.timestamps
    end
  end
end
