class OrdersController < ApplicationController
  include SortingFromParams
  before_action :set_cart
  
  decorates_assigned :order
  
  def index
    @orders = sorting_from_params('Order', Order::SORTING).where(user_id: current_user).decorate
  end

  def show
    @order = Order.find(params[:id]).decorate
  end
end

