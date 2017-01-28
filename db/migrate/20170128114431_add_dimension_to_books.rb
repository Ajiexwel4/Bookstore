class AddDimensionToBooks < ActiveRecord::Migration[5.0]
  def change
    add_reference :books, :dimension, foreign_key: true, index: true
  end
end
