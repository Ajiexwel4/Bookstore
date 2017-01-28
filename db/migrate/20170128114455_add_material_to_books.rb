class AddMaterialToBooks < ActiveRecord::Migration[5.0]
  def change
    add_reference :books, :material, foreign_key: true, index: true
  end
end
