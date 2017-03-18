class OrdersController < InheritedResources::Base
  decorates_assigned :order
  
  def index
    @orders = Order.where(user_id: current_user).decorate
  end

  def show
    @order = Order.find(params[:id]).decorate
  end
end

