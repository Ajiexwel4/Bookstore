class CheckoutsController < ApplicationController
  include Wicked::Wizard
  include CurrentCart

  before_action :set_cart, :set_current_order
  before_action :checkout_login

  steps :address, :delivery, :payment, :confirm, :complete

  def show
    @countries = Country.all    
    render_wizard 
  end

  def update
    @steps = steps
    case step
    when :address
      set_order_addresses      
    end
    render_wizard @order   
  end

  private

    def checkout_login
      if !current_user
        authenticate_user!
        redirect_to(checkouts_path(id: :address))
      end      
    end

    def set_current_order
      @order = Order.new
      @order.user = current_user
      @order.add_line_items_from_cart(@cart)
      @order
    end

    def set_order_addresses
      @billing_address = BillingAddressForm.from_params(params[:cart][:billing])
      @billing_address.save
      shipping_as_billing
      @order.billing_address = @billing_address
      @order.shipping_address = @shipping_address
    end

    def shipping_as_billing
      if params[:as_billing]
        @shipping_address = ShippingAddressForm.from_params(params[:cart][:billing])
        @shipping_address.save
      else
        @shipping_address = ShippingAddressForm.from_params(params[:cart][:shipping])   
        @shipping_address.save 
      end
    end
end