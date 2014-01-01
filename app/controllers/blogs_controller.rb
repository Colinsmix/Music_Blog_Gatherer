class BlogsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_name, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def show
  end
  
  def new
    @blog = Blog.new
  end

  def edit
  end



end
