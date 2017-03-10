class CheckoutsController < ApplicationController
  include Wicked::Wizard
  include CurrentCart

  before_action :set_cart
  before_action :checkout_login

  steps :address, :delivery, :payment, :confirm, :complete

  def show
    @country = Country.all
    
    case step
    when :address
      @billing_address = BillingAddressForm.new
      @shipping_address = ShippingAddressForm.new
    # when :delivery
    #   @delivery = DeliveryForm.new
    # when :payment
    #   @payment = PaymentForm.new
    # when :confirm 
    #   @confirm = ConfirmForm.new
    # when :complete
    #   @order = OrderForm.new
    end
    render_wizard
  end

  def update
    case step
    when :address
      @billing_address = BillingAddressForm.from_params(params)
      @shipping_address = ShippingAddressForm.from_params(params)
    # when :delivery
    #   @delivery = DeliveryForm.from_params(params)
    # when :payment
    #   @payment = PaymentForm.from_params(params)
    # when :confirm 
    #   @confirm = ConfirmForm.from_params(params)
    # when :complete
    #   @order = OrderForm.from_params(params)
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