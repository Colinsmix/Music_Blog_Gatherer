class BlogsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]  
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @search = Blog.search(params[:q])
    if params[:q]
    @blogs = @search.result.paginate(:per_page => 10, :page => params[:page])
    else
      @blogs = Blog.where(status: 'Verified').paginate(:per_page => 10, :page => params[:page])
    end
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
    redirect_to blogs_path
  end

  def unfavorite
    @blog = Blog.find(params[:id])
    @blog.users.delete(current_user)
    redirect_to blogs_path
  end

  def like

  end

  def dislike

  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:name, :url, :description)
  end

  # def favorite(blog)
  #   new_favorite = Favorite.new
  #   new_favorite.user_id = current_user.id
  #   new_favorite.blog_id = blog.id
  #   new_favorite.save
  # end


end
