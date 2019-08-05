module UsersHelper
<<<<<<< HEAD
  def gravatar_for user, options = {size: 80}
=======
  def gravatar_for user, options = {size: Settings.user.gravatar_size}
>>>>>>> Start chapter 10
    gravatar_id = Digest::MD5::hexdigest user.email.downcase
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag gravatar_url, alt: user.name, class: "gravatar"
  end
end
