class StaticPagesController < ApplicationController
  
  def home
    if user_signed_in?
      @wish = current_user.wishes.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    else
      @wishes = Wish.last(6)
    end
  end
 
  
  def help
  end

  def about
  end

  def contact
  end
end
