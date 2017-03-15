class CheckoutsController < ApplicationController
  include Wicked::Wizard
  include CurrentCart

  before_action :set_cart
  before_action :checkout_login

  steps :address, :delivery, :payment, :confirm, :complete

  def show
    @order = Order.new
    @countries = Country.all    
    render_wizard 
  end

  def update
    @order = Order.new
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

    def set_order_addresses
      @order.create_billing_address(billing_address_params)
      shipping_as_billing
    end

    def shipping_as_billing
      if params[:as_billing]
        @order.create_shipping_address(billing_address_params)
      else
        @order.create_shipping_address(shipping_address_params)
      end
    end

    def billing_address_params
      params.require(:order).require(:billing).permit(:firstname, :lastname, :address, :city, :zip, :country, :phone)
    end

    def shipping_address_params
      params.require(:order).require(:shipping).permit(:firstname, :lastname, :address_name, :city, :zip, :country, :phone)
    end
end