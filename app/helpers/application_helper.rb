module ApplicationHelper
  def user_avatar(user, size = 100)
    if user.avatar.attached?
      user.avatar.variant(resize_to_fill: [size, size])
    else
      "default-pfp.webp"
    end
  end

  def markdown(text)
    options = [:no_intra_emphasis, :tables, :autolink, :fenced_code_blocks, :strikethrough, :lax_spacing, :superscript, :underline, :highlight, :hard_wrap]
    Markdown.new(text, *options).to_html.html_safe
  end
end
