module PostsHelper

  def render_post_content(content)
    sanitize(content)
  end

end
