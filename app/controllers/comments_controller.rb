class CommentsController < ApplicationController

    before_action :authenticate_user!
    before_action :require_permission, except: [:index, :destroy]

    def index
        @user = User.find(params[:user_id])
        @post = Post.find(params[:post_id])
        @comments = @post.comments
        render :index
    end

    def new
        @user = User.find(params[:user_id])
        @post = Post.find(params[:post_id])
        @comment = Comment.new
        render :new
    end

    def create
        @user = User.find(params[:user_id])
        @post = Post.find(params[:post_id])
        @comment = @post.comments.build(params.require(:comment).permit(:post, :comment_post))
        @comment.commenter = @user
        if @comment.save
            flash[:success] = "New Comment Successfully Created."
            redirect_to user_posts_path(@user)
        else
            flash.now[:error] = "New Comment Failed to Create."
            render :new
        end
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        flash[:success] = "The Comment Successfully Destroyed."
        if current_user.is_admin
            redirect_to reports_path
        else
            redirect_to user_post_comments_path(current_user, @post)
        end
    end

    def require_permission
        @user = User.find(params[:user_id])
        if @user != current_user
          redirect_to user_path(current_user), flash: { error: "You do not have permission to do that." }
        end
    end

end