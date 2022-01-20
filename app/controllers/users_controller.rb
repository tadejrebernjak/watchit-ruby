class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
    @videos = Video.where(:user_id => @user.id).order('created_at DESC')
    @videosNewest = Video.where(:user_id => @user.id).limit(3)
    @videosPopular = Video.where(:user_id => @user.id).sort_by_popularity('DESC').limit(3)
    @videosLiked = @user.get_up_voted Video
    @videosLiked = @videosLiked.select { |video| video.user_id != @user.id }
    @channels = @user.get_up_voted User
  end

  def upvote
    @user = User.find(params[:id])
    if current_user.id != @user.id  
      if current_user.voted_up_on? @user
        @user.unvote_by current_user
      else
        @user.upvote_by current_user
      end
    end
    render "vote.js.erb"
  end
end
