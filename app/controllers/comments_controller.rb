class CommentsController < ApplicationController
  include ApplicationHelper

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:comment][:post_id])
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      @notification = new_notification(@post.user, @post.id, 'comment')
      @notification.save
    end
    redirect_to @post
  end

  def destroy
    @comment = Comment.find(params[:id])
    return unless current_user.id == @comment.user_id

    @comment.destroy
    flash[:success] = 'Comment deleted'
    redirect_back(fallback_location: posts_path)
  end

  private 

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
