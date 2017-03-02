class CreateCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :coupons do |t|
      t.string :code, uniq: true
      t.decimal :discount, precision: 8, scale: 2
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
