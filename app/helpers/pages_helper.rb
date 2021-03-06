module PagesHelper
  def safe_page?(page)
    !page.wiki && page.user.present? && page.user.role_on(current_group) == "owner"
  end
end
