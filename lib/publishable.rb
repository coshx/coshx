module Publishable
  extend ActiveSupport::Concern

  module ClassMethods
    def published
      where 'posted_on IS NOT NULL'
    end
  end

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
