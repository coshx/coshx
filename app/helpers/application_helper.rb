module ApplicationHelper

  def body_class
    (@body_class || :default).to_s
  end

  def active_tab(path)
    request.path.match(/^#{path}/) ? { :class => 'active' } : {}
  end

  #This does not support blocks like link_to does(cause who uses that...)
  def tab_to(*args)
    name         = args[0]
    url_options  = args[1] || {}
    html_options = args[2]
    url = url_for(url_options)

    link = link_to(name, url, html_options)

    if request.path == url
      raw "<li class ='selected'>" + link + "</li>"
    else
      raw "<li>" + link + "</li>"
    end
  end

  def rowify(things, row_length)
    array_of_rows_of_things = []
    ((things.length) / row_length.to_f).ceil.times do |row_num|
      n = things.length - (row_num * row_length + row_length - 1)
      n = [n, row_length - 1].max
      n = [n, 0].max
      row_of_things = things.slice((row_num * row_length)..((row_num * row_length) + n))
      array_of_rows_of_things << row_of_things
    end
    array_of_rows_of_things
  end

  def title(controller, action)
    default_title = ""

    title_hash = {
      "home" => {
        "index"       => "Software Development and Consulting",
        "about"       => "Software Development and Consulting",
        "approach"    => "Agile Software Development",
        "services"    => "Web Application Development",
        "contact_us"  => "Web Application Development",
        "careers"     => "Web Application Development Careers"
      },
      "jobs" => {
        "index"       => "Build web and mobile applications as a Coshx team member"
      },
      "posts" => {
        "index"       => "Web applications expertise from our accomplished engineering team",
        "show"        => @post.try(:title)
      },
      "projects" => {
        "index"       => "We build web software for diverse industries",
        "show"        => @project.try(:title)
      }
    }

    title_hash[controller].try(:[], action) || default_title
  end

  def should_not_display_any_footer_info
    (params[:controller] == 'errors') || controller.action_name == 'competition'
  end

  def should_not_display_site_links
    (params[:controller] == 'posts' || params[:controller] == 'projects' || current_page?('/careers'))
  end

  def should_not_display_together_section
    (params[:controller] == 'posts' || current_page?('/contact') || current_page?('/careers'))
  end

  def competition_twitter_share_text
    Rack::Utils.escape('Have a tech idea? Send us your pitch and you could win $50,000 of design and development work, no strings attached')
  end

  def on_home_page?
    current_page?('/') && controller.action_name == 'index'
  end
end
