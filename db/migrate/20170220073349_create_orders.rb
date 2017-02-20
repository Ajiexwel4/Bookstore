class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :number
      t.date :complated_at
      t.string :status
      t.decimal :total

      t.timestamps
    end
  end
end
