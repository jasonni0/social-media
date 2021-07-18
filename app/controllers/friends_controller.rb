class FriendsController < ApplicationController

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
        @friend = User.where(id: fid).order("id ASC")
        render :index
    end

    def update
        @friend1 = Friend.where("requester_id = ? AND requestee_id = ?", params[:requester_id], params[:user_id])
        if @friend1.update(status: "accepted")
            @friend2 = Friend.where("requestee_id = ? AND requester_id = ?", params[:requester_id], params[:user_id])[0]
            if @friend2.present?
                @friend2.destroy
            end
            flash[:success] = "Friend Added Successfully."
            redirect_to user_requests_path(current_user)
        else
            flash[:error] = "Unable to Add Friend."
            redirect_to user_requests_path(current_user)
        end
    end
        
    def create
        @user = User.find(params[:user_id])
        @friend = @user.requestees.build(:requestee_id => params[:requestee_id], :status => "pending")
        if @friend.save
            flash[:success] = "Friend Request Sent."
            redirect_to user_posts_path(@user)
        else
            flash[:error] = "You Already Sent Friend Request"
            redirect_to user_requests_path(current_user)
        end
    end

    def destroy
        @friend1 = Friend.where("requester_id = ? AND requestee_id = ?", params[:requester_id], params[:user_id])[0]
        @friend2 = Friend.where("requester_id = ? AND requestee_id = ?", params[:user_id], params[:requester_id])[0]
        @message1 = Message.where("sender_id = ? AND receiver_id = ?", params[:requester_id], params[:user_id])
        @message2 = Message.where("sender_id = ? AND receiver_id = ?", params[:user_id], params[:requester_id])
        if @message1.present?
            @message1.each do |m|
                m.destroy
            end
        end
        if @message2.present?
            @message2.each do |m|
                m.destroy
            end
        end
        if @friend1.present?
            @friend1.destroy
        end
        if @friend2.present?
              @friend2.destroy
        end 
        flash[:success] = "Friendship Denied Successfully."
        redirect_to request.referrer
    end
  
    def require_permission
        @user = User.find(params[:user_id])
        if @user != current_user
          redirect_to user_path(current_user), flash: { error: "You do not have permission to do that." }
        end
    end

end
