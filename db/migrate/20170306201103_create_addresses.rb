class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :firstname
      t.string :lastname
      t.string :address
      t.string :city
      t.string :zip
      t.string :country
      t.string :phone

      t.timestamps
    end
  end
end
