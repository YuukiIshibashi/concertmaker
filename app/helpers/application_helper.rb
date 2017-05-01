module ApplicationHelper
  def user_profile_img(user)
    return image_tag(user.avatar, alt: user.name) if user.avatar?
    image_tag('no_image.png', alt: user.name)
  end

  def performer_profile_img(performer)
    return image_tag(performer.avatar, alt: performer.name) if performer.avatar?
    image_tag('no_image.png', alt: performer.name)
  end

end
