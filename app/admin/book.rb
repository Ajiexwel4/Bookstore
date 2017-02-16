ActiveAdmin.register Book do
  permit_params :title, :description, :price, :cover, :publication_at, :dimension, :material,
                :in_stock, author_ids: [], category_ids: []

  index do
    selectable_column

    column :image
    column :category
    column :title
    column :authors
    column :description
    column :price
    actions
  end

  filter :title
  filter :authors
  filter :categories
  filter :price
  filter :created_at

  form partial: 'books/form'

end
