class AddAddressesColumnsToOrder < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :billing_address, foreign_key: true, index: true
    add_reference :orders, :shipping_address, foreign_key: true, index: true
  end
end
