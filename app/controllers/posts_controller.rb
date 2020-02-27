class PostsController < ApplicationController

  def index
    @posts = current_user.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(permitted_params)
    @post.users << current_user
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(permitted_params)
      redirect_to @post
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  def share
    @users = User.where.not(id: current_user.id).map{|u| [u.email, u.id] }
  end

  def share_to_users
    @post = Post.find(params[:post_id])
    params[:user_id].delete_if(&:blank?).map{|x| params[:user_id].delete(x) if @post.user_ids.include?(x.to_i) }
    @post.users << User.where(id: params[:user_id])

    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  private

  def permitted_params
    params.require(:post).permit(:title, :text)
  end
end
