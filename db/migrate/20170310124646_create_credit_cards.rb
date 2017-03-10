class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|
      t.integer :number
      t.string :name
      t.string :period
      t.integer :cvv

      t.timestamps
    end
  end
end
