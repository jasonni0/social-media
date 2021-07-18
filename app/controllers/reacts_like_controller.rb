class ReactsLikeController < ApplicationController

    before_action :authenticate_user!

    def create
        @user = User.find(params[:user_id])
        @post = Post.find(params[:post_id])
        @react = @post.reacts.build(:reacter => current_user, :is_like => true)
        if @react.save
            @post.increment!(:likes)
            flash[:success] = "Liked #{@post.title}."
            redirect_to request.referrer
        else
            flash[:error] = "You Already Reacted to This Post."
            redirect_to request.referrer
        end
    end

end
