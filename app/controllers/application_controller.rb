class ApplicationController < ActionController::Base
  protect_from_forgery

  contenteditable_filter "admin_signed_in?"

  helper_method :last_two_posts, :random_quote, :whereami, :contents

  around_filter :catch_exceptions

  def contents
    Content.all
  end

  def last_two_posts
    @last_two_posts ||= Post.published.limit(2)
  end

  def random_quote
    Quote.first(:order => "RANDOM()")
  end

  def whereami
     params[:controller].to_s + "/" + params[:action]
     #     controller.controller_name.to_s + "/" + controller.action_name
  end

  protected

    def render_page_not_found
      render :template => 'errors/not_found', :status => :not_found
    end

    def render_error
      render :template => 'errors/505'
    end


    def catch_exceptions
      if Rails.env.production?
        begin
          yield 
        rescue Exception => exception
          if exception.is_a?(ActiveRecord::RecordNotFound)
            render_page_not_found
          else
            render_error
          end
        end
      else
        yield
      end
    end

end
