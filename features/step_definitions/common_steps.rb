
When /^(?:|I )should be on the dashboard page$/ do visit ('/dashboard') end
When /^(?:|I )should be on the new blog post page$/ do visit ('/posts/new') end
When /^(?:|I )go to the dashboard page$/ do visit ('/posts/new') end
When /^(?:|I )go to the blogs page$/ do visit ('/blog') end
When /^(?:|I )go to the sign in page$/ do visit ('/admins/sign_in') end
When /^(?:|I )should be on the "(.+)" blog page$/ do |title|  visit ("/posts/#{Post.find_by_title(title).id}") end
When /^(?:|I )should be on the "(.+)" blog edit page$/ do |title| visit ("/posts/#{Post.find_by_title(title).id}/edit") end
When /^(?:|I )should be on the "(.+)" published blog page$/ do |title| visit ("/blog/#{Post.find_by_title(title).permalink}") end
When /^(?:|I )should be on the new job post page$/ do visit ('/careers/new') end
When /^(?:|I )should be on the "(.+)" job page$/ do |title|  visit ("/careers/#{Job.find_by_title(title).to_param}") end
When /^(?:|I )go to the careers page$/ do visit ('/careers') end
When /^(?:|I )should be on the "(.+)" job edit page$/ do |title| visit ("/careers/#{Job.find_by_title(title).to_param}/edit") end
When /^(?:|I )check "(.+)"$/ do |box_name| check(box_name) end
When /^(?:|I )should be on the careers page$/ do visit ('/careers') end


Given /^I am not authenticated$/ do
  page.driver.post('/admins/sign_out')
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then /^(?:|I )should not see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should_not have_content(text)
  else
    assert !page.has_content?(text)
  end
end

Then /^show me the page$/ do
  save_and_open_page
end

Given /^I fill in "([^"]*)" with "([^"]*)""$/ do |arg1, arg2|
   fill_in(arg1, :with => arg2)
end

Given /^I fill in "([^"]*)" with "([^"]*)"$/ do |arg1, arg2|
  fill_in(arg1, :with => arg2)
end


