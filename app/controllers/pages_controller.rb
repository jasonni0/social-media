class PagesController < ApplicationController

    def home 
        if !params[:search].blank?
            @results = User.all.where("lower(concat(first_name, ' ', last_name)) LIKE ?", "%#{params[:search]}%")
        end
        if user_signed_in?
            friends1 = Friend.where("status = ? AND requester_id = ?", "accepted", current_user.id)
            friends2 = Friend.where("status = ? AND requestee_id = ?", "accepted", current_user.id)
            fid = []
            friends1.each do |friend|
                fid.push(friend.requestee_id)
            end
            friends2.each do |friend|
                fid.push(friend.requester_id)
            end
            @friend = User.where(id: fid).order("id ASC")
        end
        render :home   
    end

end
