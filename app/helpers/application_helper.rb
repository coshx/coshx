module ApplicationHelper

  def body_class
    (@body_class || :default).to_s
  end

end
