module ApplicationHelper

  def body_class
    (@body_class || :default).to_s
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
    default_title = "Software Consulting for Start-Ups and the Enterprise | Coshx Labs"
    title_hash = {
      "home" => {
        "index"       => default_title,
        "about"       => "Over 80 years of combined experience with Ruby on Rails web applications",
        "services"    => "Web application consulting in Austin, Boulder, Charlottesville and San Francisco",
        "contact_us"  => "Start your web or mobile application project today by contacting Coshx"
      },
      "jobs" => {
        "index"       => "Build web and mobile applications as a Coshx team member"
      },
      "posts" => {
        "index"       => "Web applications expertise from our accomplished engineering team",
        "show"        => "Web applications expertise from our accomplished engineering team"
      },
      "projects" => {
        "index"       => "We build web software for diverse industries"
      }
    }

    title_hash[controller].try(:[], action) || default_title
  end

  def meta_description(controller, action)
    default_meta_description = "Coshx creates innovative web and mobile applications to help your business reach its goals. Our experienced engineers apply proven development technologies using an Agile framework to meet your specialized software needs."
    meta_description_hash = {
      "home" => {
        "index"       => default_meta_description,
        "about"       => default_meta_description,
        "services"    => default_meta_description,
        "contact_us"  => default_meta_description
      },
      "jobs" => {
        "index"       => default_meta_description
      },
      "posts" => {
        "index"       => default_meta_description,
        "show"        => default_meta_description
      },
      "projects" => {
        "index"       => default_meta_description
      }
    }

    meta_description_hash[controller].try(:[], action) || default_meta_description
  end

end
