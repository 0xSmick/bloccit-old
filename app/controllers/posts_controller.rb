class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  # Adding a create method to the posts_controller.rb

  def create
    @post = Post.new(params[:post])

    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to @post

    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

   def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "Post was updated."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  
end


