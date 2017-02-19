class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :book, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.string :status
      t.string :state

      t.timestamps
    end
  end
end
