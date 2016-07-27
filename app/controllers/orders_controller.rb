class OrdersController < ApplicationController
  def create
    @carted_products = current_user.carted_products.where(status: 'carted')

    order = Order.new(
      user_id: current_user.id
    )
    order.save
    order.calculate_totals(@carted_products)

    @carted_products.update_all(status: "purchased", order_id: order.id)

    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    render 'show.html.erb'
  end
end
