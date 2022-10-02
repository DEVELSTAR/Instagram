class HomeController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc).page(params[:page]).per(2)
    @comment = Comment.all
    @users = User.all
    @status = Status.all
  end
end
