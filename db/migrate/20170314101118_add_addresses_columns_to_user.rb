class AddAddressesColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :billing_address, foreign_key: true, index: true
    add_reference :users, :shipping_address, foreign_key: true, index: true
  end
end
