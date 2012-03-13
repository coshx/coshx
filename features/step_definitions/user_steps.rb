
Given /^no user exists with an email of "(.*)"$/ do |email|
  User.find(:first, :conditions => { :email => email }).should be_nil
end

Then /^I should be already signed in$/ do
  step %{I should see "Admin Portal"}
  step %{I should not see "Sign in"}
end

Then /^I sign out$/ do
  visit('/users/sign_out')
end

Given /^I am logout$/ do
  step %{I sign out}
end

Given /^I am not logged in$/ do
  step  %{I sign out}
end

When /^I sign in as "(.*)\/(.*)"$/ do |email, password|
  step %{I am not logged in}
  step %{I go to the sign in page}
  step %{I fill in "Email" with "#{email}"}
  step %{I fill in "Password" with "#{password}"}
  step %{I press "Sign in"}
end

Then /^I should be signed in$/ do
  step %{I should see "Admin Portal"}
end

When /^I return next time$/ do
  step %{I go to the home page}
end

Then /^I should be signed out$/ do
  step %{I should not see "Admin Portal"}
end
