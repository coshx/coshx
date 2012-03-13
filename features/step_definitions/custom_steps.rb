
Given /^required data exists$/ do
 Factory.create(:admin)
end


When(/^I go back$/) do
  page.evaluate_script('window.history.back()')
end

Given /^I have a valid but expired token$/ do
 Factory.create(:token,:id=>'3',:code =>'EFGH5678', :start_date =>Time.now()-4.days, :expiration_date => Time.now()-2.days)
end

Given /^I have a valid token$/ do
 Factory.create(:token, :id=>'2',:campaign_id=>'1', :merchant_id => '1',:amount => '5.0',:code =>'IJKL9101', :start_date =>Time.now()-2.days, :expiration_date => Time.now()+2.days)
end

