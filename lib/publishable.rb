module Publishable
  def publish
    unless self.published?
      self.posted_on = DateTime.now
    end
    self
  end

  def published?
    true unless self.posted_on.nil?
  end
end