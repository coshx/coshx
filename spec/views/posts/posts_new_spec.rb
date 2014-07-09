require 'spec_helper'

describe "when a picture is dropped", :js => true do
	before :each do
		@admin = FactoryGirl.build(:admin)
	end

	it "does some stuff" do 
		visit '/posts/new'
		fill_in "Email", :with => @admin.email
		fill_in "Password", :with => @admin.password
		click_button "Sign in"

		sleep(60)
		#page.execute_script("seleniumUpload = window.$('<input/>').attr({id: 'seleniumUpload', type:'file'}).appendTo('body');")

    	#attach_file('seleniumUpload', Rails.root + 'app/assets/images/cloud1.png')

    	# Trigger the drop event
    	#page.execute_script("e = $.Event('drop'); e.originalEvent = {dataTransfer : { files : seleniumUpload.get(0).files } }; $('#post_body').trigger(e);")
	end

	#it "should open a modal" do
	#	expect(page).to have_selector("div.ui-widget")
	#end

	#it "should insert an image tag" do
	#	click_button("Place the image")
	#	expect(page).to have_content("<img")
	#end
end