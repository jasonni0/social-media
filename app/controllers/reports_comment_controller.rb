class ReportsCommentController < ApplicationController

    before_action :authenticate_user!
    before_action :require_permission

    def new
        @user = User.find(params[:user_id])
        @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:comment_id])
        @report = Report.new
        render :new
    end

    def create
        @user = User.find(params[:user_id])
        @reportable = Comment.find(params[:comment_id])
        @report = @reportable.reports.build(params.require(:report).permit(:reason))
        if @report.save
            flash[:success] = "New Comment Report Successfully Created."
            redirect_to user_posts_path(current_user)
        else
            flash.now[:error] = "New Comment Report Failed to Create."
            render :new
        end
    end

    def require_permission
        @user = User.find(params[:user_id])
        if @user != current_user
          redirect_to user_path(current_user), flash: { error: "You do not have permission to do that." }
        end
    end
end
