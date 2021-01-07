class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    type = type_subject?(params)[0]
    @subject = type_subject?(params)[1]
    # notice_type = "like-#{type}"
    return unless @subject
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @subject.likes.create(user_id: current_user.id)
      if @like.save
        flash[:success] = "#{type} liked!"
      else
        flasg[:danger] = "#{type} like failed!"
      end
    end
    redirect_to post_path(@post)
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to post_path(@post)
  end

  private

  def type_subject?(params)
    type = 'post' if params.key?('post_id')
    type = 'comment' if params.key?('comment_id')
    subject = Post.find(params[:post_id]) if type == 'post'
    subject = Comment.find(params[:comment_id]) if type == 'comment'
    [type, subject]
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id:
    params[:post_id]).exists?
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_like
    @like = @post.likes.find(params[:id])
 end

end
