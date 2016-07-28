class CartedProductsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @carted_products = current_user.carted_products.where(status: 'carted')
    if @carted_products.length > 0
      render 'index.html.erb'
    else
      flash[:warning] = "You have no items in your shopping cart! TIME TO SPEND YOUR MONEY!"
      redirect_to '/'
    end
  end

  def create
    carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: 'carted'
    )
    carted_product.save
    session[:cart_count] = nil
    redirect_to '/carted_products'
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.status = "removed"
    carted_product.save
    flash[:success] = "Product removed!"
    session[:cart_count] = nil
    redirect_to "/carted_products"
  end
end
