class CreateAuthorsBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :authors_books, id: false do |t|
      t.references :author, foreign_key: true, index: true
      t.references :book, foreign_key: true, index: true
    end
    add_index :authors_books, [:author_id, :book_id]
  end
end
