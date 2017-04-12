class AddOrderColumnToCreditCard < ActiveRecord::Migration[5.0]
  def change
    add_reference :credit_cards, :order, foreign_key: true, index: true
  end
end
