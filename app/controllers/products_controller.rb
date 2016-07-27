class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]

  def index
    if params[:sort_attribute] && params[:sort_order]
      @products = Product.order(params[:sort_attribute] => params[:sort_order])
    elsif params[:max_price]
      @products = Product.where('price < ?', params[:max_price])
    elsif params[:search_terms]
      @products = Product.where("name LIKE ?", "%#{params[:search_terms]}%")
    elsif params[:category_id]
      selected_category = Category.find_by(id: params[:category_id])
      @products = selected_category.products
    else
      @products = Product.all
    end
  end

  def new
    render 'new.html.erb'
  end

  def create
    @product = Product.create(
      name: params[:name],
      description: params[:description],
      image: params[:image],
      price: params[:price],
      supplier_id: params[:supplier_id]
    )

    flash[:success] = "Product Created"
    redirect_to "/products/#{@product.id}"
  end

  def show
    if params[:id] == 'random'
      @product = Product.all.sample
    else
      @product = Product.find_by(id: params[:id])
    end
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
      name: params[:name],
      description: params[:description],
      image: params[:image],
      price: params[:price]
    )

    flash[:success] = "Product Updated"
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy

    flash[:warning] = "Product Created"
    redirect_to "/"
  end
end

