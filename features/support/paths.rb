module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'

    when /the sign in page/
      '/admins/sign_in'

    when /the dashboard page/
      '/dashboard'

    when /the new blog post page/
      '/posts/new'

    when /the new job post page/
      '/careers/new'

    when /the blogs page/
      '/blog'

    when /the children list page for "(.+)"/
          p = Parent.find_by_name($1)
          parent_children_path(p)

    when /the "(.+)" blog page/
      "/posts/#{Post.find_by_title($1).id}"

    when /the "(.+)" blog edit page/
       "/posts/#{Post.find_by_title($1).id}/edit"

    when /the "(.+)" published blog page/
        "/blog/#{Post.find_by_title($1).permalink}"



    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
