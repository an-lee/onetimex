module ApplicationHelper

  def username(user)
    if user.name.present?
      user.name
    else
      user.name = user.email.split("@").first
    end
  end

end
