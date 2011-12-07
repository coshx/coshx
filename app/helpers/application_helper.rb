module ApplicationHelper
  def body_class
    @body_class.to_s || 'default'
  end

  def page_layout(value)
    @body_class = value
  end
end
