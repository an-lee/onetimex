class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  before_action :find_product, only: [:edit, :update, :destroy]

  layout "admin"

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice: "成功添加了新商品！"
    end
  end

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to admin_products_path, notice: "商品信息已更新！"
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path, alert: "成功删除了一件商品！"
  end

private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :image)
  end

  def find_product
    @product = Product.find_by_friendly_id!(params[:id])
  end

end
