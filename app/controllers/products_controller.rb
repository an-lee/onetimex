class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :add_to_cart, :rate]

  def index
    @products = Product.all
  end

  def show
    @posts = @product.posts.order( "id DESC" ).limit(5)

    if params[:max_id]
      @posts = @posts.where( "id < ?", params[:max_id] )
    end

    respond_to do |format|
      format.html
      format.js
    end

    @comments = @product.comments.order("id DESC").all
  end

  def add_to_cart
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "你已成功将 #{@product.title} 加入购物车"
    else
      flash[:warning] = "你的购物车内已有此物"
    end
  end


  def rate
    existing_score = @product.find_score(current_user)
    if existing_score
      existing_score.update( :score => params[:score] )
    else
      @product.scores.create( :score => params[:score], :user => current_user )
    end

    render :json => { :average_score => @product.average_score }
  end


  private

  def find_product
    @product = Product.find_by_friendly_id!(params[:id])
  end

end
