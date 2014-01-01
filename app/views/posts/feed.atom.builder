atom_feed :language => 'en-US' do |feed|
    feed.title(@title)
    feed.updated(@posts[0].posted_on) if @posts.length > 0

    @posts.each do |post|
      feed.entry(post) do |entry|
        entry.title post.title
        entry.content post.body_html, :type => 'html'

        entry.author do |author|
          author.name post.author.name
        end
      end
    end
  end
