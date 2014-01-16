class CommentsController < ApplicationController

  def index
    @blog = Blog.find(params[:blog_id])
    @comments = @blog.comments
  end

  def new
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.build
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to blog_comments_path(@blog), notice: "Comment Posted Successfully!"
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :anonymous)
  end
end

