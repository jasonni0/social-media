class ReportsController < ApplicationController

    before_action :authenticate_user!
    before_action :require_permission

    def index
        @reports = Report.all
        render :index
    end

    def destroy
        @report = Report.find(params[:id])
        @report.destroy
        flash[:success] = "The Report Successfully Destroyed."
        redirect_to reports_path
    end

    def require_permission
        if current_user.is_admin != true
          redirect_to user_path(current_user), flash: { error: "You do not have permission to do that." }
        end
    end
end
