class PostsController < ApplicationController

    before_action :authenticate_user!
    before_action :require_permission
    
    def index
        @user = User.find(params[:user_id])
        friends1 = Friend.where("status = ? AND requester_id = ?", "accepted", params[:user_id])
        friends2 = Friend.where("status = ? AND requestee_id = ?", "accepted", params[:user_id])
        fid = []
        friends1.each do |friend|
            fid.push(friend.requestee_id)
        end
        friends2.each do |friend|
            fid.push(friend.requester_id)
        end
        @posts = Post.where(user_id: fid).order("id ASC")
        render :index
    end

    def new
        @user = User.find(params[:user_id])
        @post = Post.new
        render :new
    end

    def create
        @user = User.find(params[:user_id])
        @post = @user.posts.build(params.require(:post).permit(:post, :title, :description))
        if @post.save
            flash[:success] = "New Post Successfully Created."
            redirect_to user_path(@user)
        else
            flash.now[:error] = "New Post Failed to Create."
            render :new
        end
    end

    def destroy
        @user = User.find(params[:user_id])
        @post = @user.posts.find(params[:id])
        @post.destroy
        flash[:success] = "The Post Successfully Destroyed."
        if current_user.is_admin
            redirect_to reports_path
        else
            redirect_to user_path(@user)
        end
    end

    def edit
        @user = User.find(params[:user_id])
        @post = @user.posts.find(params[:id])
        render :edit
    end

    def update
        @user = User.find(params[:user_id])
        @post = @user.posts.find(params[:id])
        if @post.update(params.require(:post).permit(:post, :title, :description))
            flash[:success] = "The Post Successfully Updated."
            redirect_to user_path(@user)
        else
            flash.now[:error] = "Post Failed to Update."
            render :edit
        end
    end

    def require_permission
        @user = User.find(params[:user_id])
        if current_user.is_admin != true
            if @user != current_user
                redirect_to user_path(current_user), flash: { error: "You do not have permission to do that." }
            end
        end
    end

end
