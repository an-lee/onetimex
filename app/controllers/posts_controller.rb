class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :find_product, only: [:new, :create, :show, :destroy, :edit, :update, :like, :unlike, :star, :unstar]
  before_action :find_post, only: [:edit, :destroy, :update, :show, :like, :unlike, :star, :unstar]

  def new
    @post = @product.posts.new
  end

  def create
    @post = @product.posts.new(post_params)
    @post.user = current_user
    @post.save
  end

  def show
    @comments = @post.comments.all.order("id DESC")
    @comment = @post.comments.new
  end

  def edit
  end

  def update
    @post.update(post_params)
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
  end

  def like
    current_user.create_action(:like, target: @post)
  end

  def unlike
    current_user.destroy_action(:like, target: @post)
    render "like"
  end

  def star
    current_user.create_action(:star, target: @post)
  end

  def unstar
    current_user.destroy_action(:star, target: @post)
    render "star"
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
