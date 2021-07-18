class RequestsController < ApplicationController

    before_action :authenticate_user!
    before_action :require_permission

    def index
        @user = User.find(params[:user_id])
        @pendings = Friend.where("status = ? AND requestee_id = ?", "pending", params[:user_id])
        render :index
    end

    def require_permission
        @user = User.find(params[:user_id])
        if @user != current_user
          redirect_to user_path(current_user), flash: { error: "You do not have permission to do that." }
        end
    end
    
end
