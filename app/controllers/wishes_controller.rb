class WishesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user, only: :destroy
  
  def create
    @wish = current_user.wishes.build(wish_params)
    if @wish.save
      flash[:success] = "Wish  created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end
  
  def destroy
    @wish.destroy
    redirect_to current_user
  end
  
  def index
  end
  
  private
  
  def correct_user
    @wish = current_user.wishes.find_by_id(params[:id])
    redirect_to root_path if @wish.nil?
  end
  
  def wish_params
    params.require(:wish).permit(:content, :picture, :remote_picture_url, :title, :price, :username)
  end
end