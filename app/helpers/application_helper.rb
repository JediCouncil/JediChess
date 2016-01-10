module ApplicationHelper
  def gravatar_url(user)
    gravatar_id = Digest::MD5.hexidigest(user.email.downcase)
    "https://secure.gravatar.com/avatar/#{gravatar_id}?s=200&r=pg&d=retro"
  end
end
