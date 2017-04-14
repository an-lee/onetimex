module ApplicationHelper

  def username(user)
    if user.name.present?
      user.name
    else
      user.name = user.email.split("@").first
    end
  end

  def render_user_avatar(user, size)
    # size = ['mdavatar', 'smavatar', 'nmavatar']
    if user.avatar.present?
      # byebug
      if size == 90
        user.avatar.mdavatar
      elsif size == 40
        user.avatar.smavatar
      elsif size == 20
        user.avatar.xsavatar
      else
        user.avatar
      end
    else
      avatar_url(user, size)
    end
  end

  def avatar_url(user, size)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=retro&r=g"
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end
