class StatusesController < ApplicationController

	def show
        # @users = User.all
        # @user = User.find(params[:id])
        # @statuses = @user.statuses
        # @status = @user.statuses.last
        # @status = Status.find(params[:user_id])
        # @statuses = Status.all
        @status = Status.last
	end

    def new
        @status = Status.new
    end

    def create
    	Status.create(status_params)
    	redirect_to root_path
    end

    def destroy
    	@status = Status.find(params[:id])
    	@status.destroy
    	redirect_to root_path
    end

    private

    def status_params
    	params.require(:status).permit(:body, :image, :user_id)
    end
end
