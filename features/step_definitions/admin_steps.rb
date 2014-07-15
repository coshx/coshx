include AwsHelper

Given /testuser_1@coshx.com is a valid admin$/ do
  FactoryGirl.create(:admin,:email =>"testuser_1@coshx.com", :password=> "password_1")
end

Given /the proper s3 data structure exists$/ do
  Fog.mock!
  ENV['S3_KEY'] = "S3_KEY"
  ENV['S3_SECRET'] = "S3_SECRET"
  connection.directories.create(
    :key => "coshx-blog-images",
    :public => true
  )
end

Given /there are no jobs/   do
  Job.delete_all
end

When /^I sign in as "(.+)" \/ "(.+)"$/ do |email, password|
  step %{I go to the sign in page}
  step %{I fill in "admin_email" with "#{email}"}
  step %{I fill in "admin_password" with "#{password}"}
  step %{I press "Sign in"}
end

Given /^twitter is configured$/ do
  module Twitter
    def self.update(something)
    end
  end
end


#contenteditable tests

And /^I should see contenteditable "([^\"]*)"$/ do |element|
  pending
  #a = find("[data-tag='#{element}']")
  #a["contenteditable"].should == "true"
end

And /^I change the content of "([^\"]*)" to "([^\"]*)"$/ do |element, text|
  pending
  # page.execute_script("$(\"[data-tag='#{element}']\").text('#{text}')")
end

And /^I save the contenteditable changes$/ do
  pending
  #page.execute_script("$('.contenteditable_save_button').show();")
  #find(".contenteditable_save_button").click
end

And /^contenteditable "([^\"]*)" should be "([^\"]*)"$/ do  |element, text|
  pending
  #e = find("[data-tag='#{element}']")
  #e.text.should == text.upcase
end
