class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string   :title
      t.text     :description
      t.string   :cover
      t.decimal  :price, precision: 8, scale: 2
      t.integer  :publication_at
      t.string   :dimension
      t.string   :material
      t.integer  :in_stock

      t.timestamps
    end
  end
end
