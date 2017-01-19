class CommentsController < ApplicationController
  before_action :logged_in_user

  def new
    # necessary for validation error message
    @comment = Comment.new
    @postId = params[:post_id]
  end

  def create
    @comment = Comment.new
    @comment.message = params[:message]
    @comment.post_id = params[:post_id]
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to post_path(:id => params[:post_id])
    else
      render 'new'
    end
  end
end
