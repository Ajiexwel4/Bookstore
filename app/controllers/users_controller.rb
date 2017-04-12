class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:update_email, :update_password, :update_billing_address, :update_shipping_address]

  def edit
    @user = current_user
    @billing_address = BillingAddress.find_by_user_id(current_user.id) || BillingAddress.new
    @shipping_address = ShippingAddress.find_by_user_id(current_user.id) || ShippingAddress.new
  end

  def update_email
    if @user.update(email_params)
      redirect_to users_edit_path, notice: 'Email has been updated!'
    else
      render "edit"
    end
  end

  def update_password
    user = User.find_by_email(current_user.email).try(:authenticate, params[:current_password])
    if user && @user.update(user_password_params)
      bypass_sign_in(@user)
      redirect_to users_edit_path, notice: 'Password has been updated!'
    else
      render "edit", error: 'Invalid input'
    end
  end

  def update_billing_address
    @billing_address = BillingAddress.find_by_user_id(current_user.id) || BillingAddress.new
    if @billing_address.update(billing_address_params)
      redirect_to users_edit_path, notice: 'Billing address has been updated!'
    else
      render "edit"
    end
  end

  def update_shipping_address
    @shipping_address = ShippingAddress.find_by_user_id(current_user.id) || ShippingAddress.new
    if @shipping_address.update(shipping_address_params)
      redirect_to users_edit_path, notice: 'Shipping address has been updated!'
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(current_user.id)
    if @user.destroy
      redirect_to root_url, notice: "User deleted."
    end
  end

  private

    def set_user
      @user = User.find(current_user.id)
    end

    def user_password_params
      params.require(:user).permit(:password, :password_confirmation) 
    end

    def email_params
      params.require(:user).permit(:email)
    end

    def billing_address_params
      params.require(:billing_address).permit(:user_id, :firstname, :lastname, :address, :city, :zip, :country, :phone)
    end

    def shipping_address_params
      params.require(:shipping_address).permit(:user_id, :firstname, :lastname, :address, :city, :zip, :country, :phone)
    end
end
