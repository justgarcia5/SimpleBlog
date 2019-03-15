class PostsController < ApplicationController
  # http_basic_authenticate_with name: "Justin", password:"1234", except: [:index, :show]
  before_action :authenticate_user!

  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if(@post.save)
      redirect_to @post
    else
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if(@post.update(post_params))
      redirect_to @post
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private def post_params
    params.require(:posts).permit(:title, :body)
  end
end
