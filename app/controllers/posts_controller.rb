class PostsController < ApplicationController
  before_action :authenticate_user!
	
	def show
	  @post = Post.find(params[:id])
	  @comments = @post.comments.order(created_at: :desc)
	end

	def create
	  Post.create(post_params)
	  redirect_to root_path
	end
		
	def destroy
	  @post = current_user.posts.find(params[:id])
	  @post.destroy
	  redirect_to user_path(current_user)
	end

	private
	
	def post_params
	  params.require(:post).permit(:description, :image, :user_id, :comment_id)
	end

end
