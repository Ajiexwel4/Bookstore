class CartsController < InheritedResources::Base
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  respond_to :html, :json

  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to catalog_index_url, notice: 'Cart is empty' }
      format.json { head :no_content }
    end
  end

  private

    def set_cart
      @cart = Cart.find(params[:id])
    end

    def cart_params
      params.require(:cart).permit(:id)
    end

    def invalid_cart
      logger.error 'Attempt to access invalid cart #{params[:id]}"'
      redirect_to catalog_index_url, notice: 'Invalid cart'
    end
end

