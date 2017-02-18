ActiveAdmin.register Author do
permit_params :firstname, :lastname, :description

  index do
    selectable_column
    column :firstname
    column :lastname
    column :description
    actions
  end

  filter :firstname
  filter :lastname
  filter :description
end
