class BlogsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.where(status: "Verified").search(params[:search]).order("blogs.#{sort_column} #{sort_direction}").paginate(:per_page => 5, :page => params[:page])
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.submitter = current_user
    if @blog.save
      redirect_to root_path, notice: 'Blog Added!'
    else
      render 'new'
    end
  end

  def favorite
    @blog = Blog.find(params[:id])
    @blog.users << current_user
    render success: true, json: {data: 'Test'}
  end

  def unfavorite
    @blog = Blog.find(params[:id])
    @blog.users.delete(current_user)
    render success: true, json: {data: 'Test'}
  end

  def like
    @blog = Blog.find(params[:id])
    if current_user.voted_for? @blog
      if current_user.voted_down_on? @blog
        @blog.undisliked_by current_user
      else
      end
    else
      @blog.liked_by current_user
    end
    render success: true, json: {data: 'Test'}
  end

  def dislike
    @blog = Blog.find(params[:id])
    if current_user.voted_for? @blog
      if current_user.voted_up_on? @blog
        @blog.unliked_by current_user
      else
      end
    else
      @blog.disliked_by current_user
    end
    render success: true, json: {data: 'Test'}
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:name, :url, :description)
  end

  def sort_column
  Blog.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
  %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

end
