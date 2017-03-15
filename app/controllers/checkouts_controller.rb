class CheckoutsController < ApplicationController
  include Wicked::Wizard
  include CurrentCart

  before_action :checkout_login, :countries
  before_action :set_cart
  before_action :current_order
  
  steps :address, :delivery, :payment, :confirm, :complete

  def show
    render_wizard 
  end

  def update    
    @steps = steps
    case step
    when :address
      order_addresses  
    when :delivery
      @order.delivery = Delivery.find(params[:delivery_id])    
    when :payment

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

    def order_addresses
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

    def current_order
      @order = Order.where(id: @cart.id).empty? ? Order.new(id: @cart.id) : Order.find(@cart.id)
    end

    def countries
      @countries = Country.all
    end
end