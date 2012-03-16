atom_feed :language => 'en-US' do |feed|
    feed.title("Coshx Labs Blog")
    feed.updated(@posts[0].created_at) if @posts.length > 0

    @posts.each do |post|
      feed.entry(post) do |entry|
        entry.title post.title
        entry.content post.body, :type => 'html'

        entry.author do |author|
          author.name post.author.name
        end
      end
    end
  end
