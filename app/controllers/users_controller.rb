class UsersController < ApplicationController
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def show
    @user = User.find(params[:id])
    @wishes = @user.wishes.paginate(page: params[:page])
  end
  
  
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end
  
  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
 # def avatar_url(user)
  #  if user.avatar?
  #    user.avatar
  #  else
  #    default_url="#{root_url}images/guest.png"
  # end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar, :avatar_remote_url)
  end
  
  def wish_params
    params.require(:wish).permit(:content, :avatar, :title, :price, :picture)
  end
end
