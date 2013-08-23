module UsersHelper
  
  def current_user?(user)
    user == current_user
  end
  
  def avatar_for(user)
    image_tag(avatar_url, alt: user.username, class: "avatar")
  end
end
