class PostsController < ApplicationController
  before_action :authenticate_user!
	
	def show
	  @post = Post.find(params[:id])
	  @comments = @post.comments.order(created_at: :desc)

	  mark_notifications_as_read
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
	
  def mark_notifications_as_read
    if current_user
      notifications_to_mark_as_read = @post.notifications_as_post.where(recipient: current_user)
      notifications_to_mark_as_read.update_all(read_at: Time.zone.now)
    end
  end

end
