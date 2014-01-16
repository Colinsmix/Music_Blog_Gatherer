class CommentsController < ApplicationController
  before_filter :user_made_comment, only: [:edit, :update, :destroy]


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

  def edit
    @blog = Blog.find(params[:blog_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:blog_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to blog_comments_path(@blog), notice: 'Your comment was successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to blog_comments_path(@blog), notice: 'Comment successfully destroyed'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :anonymous)
  end

  def user_made_comment
    @comment = Comment.find(params[:id])
    @blog = Blog.find(params[:blog_id])
    redirect_to blog_comments_path(@blog), notice: 'Not your comment!' if @comment.user != current_user
  end
end

