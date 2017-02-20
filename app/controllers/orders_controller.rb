class OrdersController < InheritedResources::Base

  private

    def order_params
      params.require(:order).permit(:number, :complated_at, :status, :total)
    end
end

