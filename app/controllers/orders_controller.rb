class OrdersController < ApplicationController
  def create
    order = Order.new(
      user_id: current_user.id,
      quantity: params[:quantity]
    )
    order.save
    flash[:success] = "Order created!"
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    render 'show.html.erb'
  end
end
