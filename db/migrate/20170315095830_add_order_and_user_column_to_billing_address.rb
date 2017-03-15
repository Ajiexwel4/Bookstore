class AddOrderAndUserColumnToBillingAddress < ActiveRecord::Migration[5.0]
  def change
    add_reference :billing_addresses, :order, foreign_key: true, indes: true
    add_reference :billing_addresses, :user, foreign_key: true, indes: true
  end
end
