class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :comment
      t.integer :grade
      t.string :state
      t.boolean :approval, default: false

      t.timestamps
    end
  end
end
