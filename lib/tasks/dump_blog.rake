task :dump_blog => :environment do
  out_dir = "#{Rails.root}/tmp/blog_dumps/#{Time.now.strftime("%Y%m%d%H%M%S")}"
  `mkdir -p #{out_dir}`

#  Post.includes(:author).order(:created_at).limit(1).each do |post|
  Post.includes(:author).order(:created_at).each do |post|
    filename = <<EOF.gsub(/\n/, "")
#{post.created_at.strftime("%Y-%m-%d")}-
#{post.title.downcase.gsub(/[^\w\s]/, '').gsub(/\s+/, '-')}
.html.markdown
EOF

    File.open("#{out_dir}/#{filename}", "w") do |f|
      f.puts "---"
      f.puts "title: \"#{post.title.gsub(/"/, '\"')}\""
      f.puts "date: #{post.created_at.strftime("%Y-%m-%d")}"
      f.puts "author: #{post.author.name}"
      f.puts "published: #{post.published?}"
      f.puts "---"
      f.puts
      f.puts post.body.gsub(/\r/, "")
    end
  end
end
