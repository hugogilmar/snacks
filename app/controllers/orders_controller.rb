class OrdersController < ApplicationController
  before_action :authenticate_request!

  def create
    order.assign_attributes(order_params)

    if order.valid?
      order.save()

      render json: order
    else
      render_unprocessable_entity(order.errors)
    end
  end

  protected

  def order
    @order ||= current_user.orders.new
  end

  def order_params
    params[:order] ? params.require(:order).permit(:product_uuid, :quantity) : {}
  end
end
