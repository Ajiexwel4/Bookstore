class CheckoutsController < ApplicationController
  include Wicked::Wizard

  decorates_assigned :order

  before_action :checkout_login, :set_cart, :current_order
  
  steps :address, :delivery, :payment, :confirm, :complete

  def show
    starting_order
    if step == :complete
      order_complete
    end    
    render_wizard
  end

  def update    
    case step
    when :address
      order_addresses
    when :delivery
      @order.delivery = Delivery.find(params[:delivery_id])   
    when :payment
      @order.credit_card = CreditCard.create(credit_card_params)
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

    def credit_card_params
      params.require(:credit_card).permit(:number, :name, :period, :cvv)
    end

    def current_order
      @order = Order.where(id: @cart.id).empty? ? Order.new(id: @cart.id) : Order.find(@cart.id)
    end

    def starting_order
      @order.user = current_user
      @order.add_line_items_from_cart(@cart)
      @order.number = 'R' + @order.id.to_s
      @order.total = @order.total_price
    end

    def order_complete
      @order.accept  
      @order.complated_at = Time.now.strftime("%B %d, %Y")
      @order.save!
      Cart.destroy(@cart)
    end
end