ActiveAdmin.register Review do

  scope :all
  scope :approved
  scope :rejected
  scope :unprocessed

  index do
    selectable_column
    column :title
    column :comment
    column :status
    column :grade
    column :user_id
    column :book_id
    column :created_at
    actions
  end

  filter :title
  filter :status
  filter :grade
  filter :user_id
  filter :book_id
  filter :created_at

  form do |f|
    f.input :title
    f.input :comment
    f.input :grade
  end

  permit_params :title, :comment, :status, :grade, :user_id, :book_id

  action_item :approve, only: :show do
    link_to 'Approve', approve_admin_review_path(review), method: :put if !review.approved?
  end

  action_item :reject, only: :show do
    link_to 'Reject', reject_admin_review_path(review), method: :put if !review.rejected?
  end

  member_action :approve, method: :put do
    review = Review.find(params[:id])
    review.approved!
    redirect_to admin_review_path(review)
  end

  member_action :reject, method: :put do
    review = Review.find(params[:id])
    review.rejected!
    redirect_to admin_review_path(review)
  end
end
