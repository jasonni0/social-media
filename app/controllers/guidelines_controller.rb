class GuidelinesController < ApplicationController

    before_action :authenticate_user!
    before_action :require_permission, except: [:index]

    def index
        @guidelines = Guideline.all
        render :index
    end

    def new
        @guideline = Guideline.new
        render :new
    end

    def create
        @guideline = Guideline.new(params.require(:guideline).permit(:guideline))
        if @guideline.save
            flash[:success] = "New Guideline Successfully Created."
            redirect_to guidelines_path
        else
            flash.now[:error] = "New Guideline Failed to Create."
            render :new
        end
    end

    def destroy
        @guideline = Guideline.find(params[:id])
        @guideline.destroy
        flash[:success] = "The Guideline Successfully Destroyed."
        redirect_to guidelines_path
    end

    def require_permission
        if current_user.is_admin != true
          redirect_to user_path(current_user), flash: { error: "You do not have permission to do that." }
        end
    end

end
