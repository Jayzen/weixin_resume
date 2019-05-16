module ApplicationHelper
  include DeviseHelper 

  def full_title(page_title = '')
    base_title = "微信名片"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def has_error?(resource, field)
    resource.errors.messages[field].present?
  end

  def get_error(resource, field)
    resource.errors.messages[field].join(', ')
  end 
end
