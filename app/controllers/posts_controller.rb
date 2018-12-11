class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  
  def index
  end

  def new
    @post = Post.new
  end 

  def create
    @post = Post.new post_params

    if @post.save
      redirect_to @post, notice: "Remember the benevolent universe premise."
    else
      render 'new', notice: "Did not save post."
    end
  end

  def show
    find_post
  end

  def edit
  end

  def update
    if @post.update post_params
      redirect_to @post, notice: "If success was impossible, then no invention, not even fire, would exist."
    else
      render 'edit'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
