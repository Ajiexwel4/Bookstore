class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :comment
      t.integer :grade
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
