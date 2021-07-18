class ReactsDislikeController < ApplicationController

    before_action :authenticate_user!

    def create
        @post = Post.find(params[:post_id])
        @react = @post.reacts.build(:reacter => current_user, :is_like => false)
        if @react.save
            @post.increment!(:dislikes)
            flash[:success] = "Disliked #{@post.title}."
            redirect_to request.referrer
        else
            flash[:error] = "You Already Reacted to This Post."
            redirect_to request.referrer
        end
    end

end
