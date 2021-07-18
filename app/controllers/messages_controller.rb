class MessagesController < ApplicationController

    before_action :authenticate_user!
    before_action :require_permission

    def show
        @user = User.find(params[:user_id])
        @friend = User.find(params[:friend_id])
        message1 = Message.where("sender_id = ? AND receiver_id = ?", params[:user_id], params[:friend_id])
        message2 = Message.where("sender_id = ? AND receiver_id = ?", params[:friend_id], params[:user_id])
        mid = []
        message1.each do |m|
            mid.push(m.id)
        end
        message2.each do |m|
            mid.push(m.id)
        end
        @messages = Message.where(id: mid).order("id ASC")
        @message = Message.new
        render :show
    end

    def create
        @user = User.find(params[:user_id])
        @friend = User.find(params[:friend_id])
        @message = Message.new(params.require(:message).permit(:content))
        @message.sender_id = @user.id
        @message.receiver_id = @friend.id
        if @message.save 
            flash[:success] = "Message Sent."
            redirect_to user_friend_message_path(@user, @friend)
        else
            flash[:error] = "Message Failed to Send."
            redirect_to request.referrer
        end
    end

    def require_permission
        @user = User.find(params[:user_id])
        if @user != current_user
          redirect_to user_path(current_user), flash: { error: "You do not have permission to do that." }
        end
    end
end