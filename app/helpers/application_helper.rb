module ApplicationHelper
  # def markdown(content)
  #   @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, space_after_headers: true, fenced_code_blocks: true)
  #   @markdown.render(content)
  # end

  def permission?
    if current_user
      if current_user.is_admin? or current_user.is_moderator?
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def is_admin?
    current_user.is_admin?
  end

  def is_moderator?
    current_user.is_moderator?
  end

end
