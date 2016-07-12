class CommentsController < ApplicationController
  def index
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    @comment.save

    redirect_to @comment.post
  end

private
  def comment_params
  params.require(:comment).permit(:commenter, :content).merge(user: current_user, post_id: params[:post_id])
    
  end

end
