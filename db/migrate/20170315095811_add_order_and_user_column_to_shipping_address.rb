class AddOrderAndUserColumnToShippingAddress < ActiveRecord::Migration[5.0]
  def change
    add_reference :shipping_addresses, :order, foreign_key: true, indes: true
    add_reference :shipping_addresses, :user, foreign_key: true, indes: true
  end
end
