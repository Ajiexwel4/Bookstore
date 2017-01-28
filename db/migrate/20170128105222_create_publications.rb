class CreatePublications < ActiveRecord::Migration[5.0]
  def change
    create_table :publications do |t|
      t.belongs_to :book, foreign_key: true, index: true
      t.belongs_to :author, foreign_key: true, index: true
      t.integer :publication_at, index: true, default: Time.now.year

      t.timestamps
    end
  end
end
