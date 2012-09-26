Given /testuser_1@coshx.com is a valid admin$/ do
  FactoryGirl.create(:admin,:email =>"testuser_1@coshx.com", :password=> "password_1")
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

