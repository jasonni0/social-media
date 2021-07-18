class UsersController < ApplicationController

    before_action :authenticate_user!, except: [:index]
    before_action :require_permission, only: [:destroy]
    before_action :admin_not_allowed, only: [:index]

    def index
        @user = User.find(params[:id])
        friends1 = Friend.where("status = ? AND requester_id = ?", "accepted", params[:id])
        friends2 = Friend.where("status = ? AND requestee_id = ?", "accepted", params[:id])
        fid = []
        friends1.each do |friend|
            fid.push(friend.requestee_id)
        end
        friends2.each do |friend|
            fid.push(friend.requester_id)
        end
        @friend = User.where(id: fid).order("id ASC")
        if current_user.present?
            friends3 = Friend.where("status = ? AND requester_id = ?", "accepted", current_user.id)
            friends4 = Friend.where("status = ? AND requestee_id = ?", "accepted", current_user.id)
            fid2 = []
            friends3.each do |friend|
                fid2.push(friend.requestee_id)
            end
            friends4.each do |friend|
                fid2.push(friend.requester_id)
            end
            @currFriend = User.where(id: fid2).order("id ASC")
        end
        render :index
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        flash[:success] = "The User Successfully Destroyed."
        redirect_to reports_path
    end

    def require_permission
        @user = User.find(params[:id])
        if current_user.present?
            if current_user.is_admin != true
                if @user != current_user
                    redirect_to user_path(current_user), flash: { error: "You do not have permission to do that." }
                end
            end
        end
    end

    def admin_not_allowed
        @user = User.find(params[:id])
        if current_user.present?
            if current_user.is_admin == true and current_user == @user
                redirect_to reports_path, flash: { error: "You do not have permission to do that." }
            end
        end
    end

end

