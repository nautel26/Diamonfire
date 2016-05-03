class UserDecorator < Draper::Decorator
  delegate_all

  def show_avatar
    "https://api.adorable.io/avatars/200/#{username}"
  end

  def show_title
    name.presence || username.presence || email.split("@").first
  end
end
