
  class Admin::BlogsController < ApplicationController
    before_filter :is_admin

    def index
      @blogs = Blog.where(status:"unverified")
    end

    def edit
      @blog = Blog.find(params[:id])
    end

    def show
    end

    def update
      @blog = Blog.find(params[:id])
      if @blog.update({status: params[:blog][:status], tag_list: params[:blog][:tag_list]})
        redirect_to admin_blogs_path, notice: 'Blog Verified Successfully'
      else
        render 'edit'
      end
    end

    private

    def blog_params
      params.require(:blog).permit(:name, :url, :description, :tag_list, :status)
    end

    def is_admin
      redirect_to root_path, notice: 'Must be an admin!' if !user_signed_in? || current_user.role != 'Admin'
    end
  end
