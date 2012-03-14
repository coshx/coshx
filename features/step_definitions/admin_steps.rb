Given /testuser_1@coshx.com is a valid admin$/ do
  Factory(:admin)
end

When /^I sign in as "(.+)" \/ "(.+)"$/ do |email, password|
  step %{I go to the sign in page}
  step %{I fill in "admin_email" with "#{email}"}
  step %{I fill in "admin_password" with "#{password}"}
  step %{I press "Sign in"}
end

