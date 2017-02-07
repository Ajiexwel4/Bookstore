ActiveAdmin.register User do
  permit_params :email, :uid, :provider

  index do
    selectable_column
    id_column
    column :email
    column :uid
    column :provider
    column :created_at
    actions
  end

  filter :email
  filter :uid
  filter :provider
  filter :created_at
end
