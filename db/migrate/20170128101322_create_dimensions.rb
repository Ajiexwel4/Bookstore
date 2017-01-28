class CreateDimensions < ActiveRecord::Migration[5.0]
  def change
    create_table :dimensions do |t|
      t.float :height
      t.float :width
      t.float :deep

      t.timestamps
    end
  end
end
