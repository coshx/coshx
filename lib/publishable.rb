module Publishable
  extend ActiveSupport::Concern

  module ClassMethods
    def published
      where 'posted_on IS NOT NULL'
    end
  end

  def publish
    tap { self.posted_on ||= DateTime.now }
  end

  def published?
    posted_on.present?
  end
end
