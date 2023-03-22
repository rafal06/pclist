module ApplicationHelper
  def user_avatar(user, size = 100)
    if user.avatar.attached?
      user.avatar.variant(resize_to_fill: [size, size])
    else
      "default-pfp.webp"
    end
  end
end
