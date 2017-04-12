class CreateDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :deliveries do |t|
      t.string :title
      t.string :days
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
