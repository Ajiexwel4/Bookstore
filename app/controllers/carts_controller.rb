class CartsController < ApplicationController
  before_action :set_cart
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  def show
    @coupon = Coupon.where(code: params[:coupon_code]).first
  end

  private

    def cart_params
      params.require(:cart).permit(:id)
    end

    def invalid_cart
      logger.error 'Attempt to access invalid cart #{params[:id]}"'
      redirect_to catalog_index_url, notice: 'Invalid cart'
    end
end

