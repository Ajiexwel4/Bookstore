class CheckoutsController < ApplicationController
  include Wicked::Wizard
  include CurrentCart

  before_action :set_cart
  before_action :checkout_login

  steps :address, :delivery, :payment, :confirm, :complete

  def show
    @countries = Country.all.pluck(:name)
    
    case step
    when :address
      @billing_address = BillingAddressForm.new
      @shipping_address = ShippingAddressForm.new
    end
    render_wizard
  end

  def update
    case step
    when :address
      @billing_address = BillingAddressForm.from_params(params)
      @shipping_address = ShippingAddressForm.from_params(params)   
    end
    render_wizard    
  end

  private

    def checkout_login
      if !current_user
        authenticate_user!
        redirect_to(checkouts_path(id: :address))
      end      
    end
end