namespace :coshx do
  desc <<-DESC
    Load data for testing.
  DESC
  task :load_test_data => [:environment] do
    Admin.delete_all
    Post.delete_all

    ben = Admin.create({name: 'Ben Taitelbaum', email: 'ben@coshx.com', password: 'password'})
    puts "Created User #{ben.name}"

    mike = Admin.create({name: 'Mike Hickman', email: 'mike@coshx.com', password: 'password'})
    puts "Created User #{mike.name}"

    5.times do
      Post.create(:author => mike, :title => Forgery::BlogPost.title, :body => Forgery::BlogPost.body)
      Post.create(:author => ben, :title => Forgery::BlogPost.title, :body => Forgery::BlogPost.body)
    end

    puts "Finished loading test data."
  end
end