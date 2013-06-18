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

end
