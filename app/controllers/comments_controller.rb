class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:create, :like, :unlike]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    # redirect_to product_post_path(@product, @post)
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
  end

  def like
    @comment = Comment.find(params[:id])
    current_user.create_action(:like, target: @comment)
  end

  def unlike
    @comment = Comment.find(params[:id])
    current_user.destroy_action(:like, target: @comment)
    render "like"
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
