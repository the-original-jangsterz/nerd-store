class ProductsController < ApplicationController
  def index
    if params[:sort_attribute] && params[:sort_order]
      @products = Product.order(params[:sort_attribute] => params[:sort_order])
    elsif params[:max_price]
      @products = Product.where('price < ?', params[:max_price])
    else
      @products = Product.all
    end
  end

  def new
  end

  def create
    @product = Product.create(
      name: params[:name],
      description: params[:description],
      image: params[:image],
      price: params[:price]
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

  def run_search
    @products = Product.where("name LIKE ?", "%#{params[:search_terms]}%")
    render 'index.html.erb'
  end
end

