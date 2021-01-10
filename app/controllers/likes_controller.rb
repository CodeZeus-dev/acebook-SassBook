class LikesController < ApplicationController
  include ApplicationHelper

  def create
    type = type_subject?(params)[0]
    @subject = type_subject?(params)[1]
    # notice_type = "like-#{type}"
    return unless @subject

    @like = @subject.likes.create(user_id: current_user.id)

    if @like.save!
      flash[:success] = "#{type} liked!"
      # @notification = new_notification(@subject.user, @subject.id, notice_type)
      # @notification.save
    else
      flash[:danger] = "#{type} like failed!"
    end

    redirect_back(fallback_location: posts_path)
  end

  def destroy
    
    if params.key?('post_id')
      @post = Post.find(params[:post_id])
      @like = @post.likes.find(params[:id])
    elsif params.key?('comment_id')
      @comment = Comment.find(params[:comment_id])
      @like = @comment.likes.find(params[:id])
      @post = Post.find(@comment.post_id)
    end
 
    @like.destroy

    redirect_to post_path(@post)
  end

  private

  # Returns the subject being liked (comment or post)
  def type_subject?(params)
    type = 'post' if params.key?('post_id')
    type = 'comment' if params.key?('comment_id')

    subject = Post.find(params[:post_id]) if type == 'post'
    subject = Comment.find(params[:comment_id]) if type == 'comment'

    [type, subject]
  end
end