class CreateBooksCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :books_categories do |t|
      t.references :book, foreign_key: true
      t.references :category, foreign_key: true
    end
    add_index :books_categories, [:book_id, :category_id]
  end
end
