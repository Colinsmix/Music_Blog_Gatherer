
  class Admin::BlogsController < ApplicationController

    def index
      @blogs = Blog.where(verified?:"unverified")
    end

    def edit
      @blog = Blog.find(params[:id])
    end

    def show
    end

    def update
      @blog = Blog.find(params[:id])
      if @blog.update(blog_params)
        redirect_to admin_blogs_path, notice: 'Blog Verified Successfully'
      else
        render 'edit'
      end
    end

    private

    def blog_params
    params.require(:blog).permit(:name, :url, :description, :tag_list, :verified?)
    end
  end
