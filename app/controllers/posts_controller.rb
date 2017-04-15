class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :find_product, only: [:new, :create, :show, :destroy, :edit, :update]
  before_action :find_post, only: [:edit, :destroy, :update, :show]

  def new
    @post = @product.posts.new
  end

  def create
    @post = @product.posts.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to product_post_path(@product)
    end
  end

  def show
    @comments = @post.comments.all
    @comment = @post.comments.new
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to product_post_path(@product)
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_product
    @product = Product.find(params[:product_id])
  end

  def find_post
    @post = @product.posts.find(params[:id])
  end

end
