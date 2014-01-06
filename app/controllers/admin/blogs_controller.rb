module Admin
  class BlogsController < ApplicationController

    def index
      @blogs = Blog.where("verified? = unverified")
    end

    def edit
      
    end
  end
end