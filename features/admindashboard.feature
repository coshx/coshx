
Feature: Admin Dashboard functionality

 Background:
   Given required data exists

     Scenario: Admin signs in and makes a blog post
      Given go to the sign in page
      Then I should see "Sign in"
      When I fill in "admin_email" with "testuser_1@coshx.com"
      And I fill in "admin_password" with "password_1"
      When I press "Sign in"
      Then I should be on the dashboard page
      And I should see "Admin Dashboard"
      When I follow "New Blog Post"
      Then I should be on the new blog post page
      And I should see "New Blog Post"
      When I fill in "post_title" with "post title"
      And I fill in "post_body" with "post body"
      And I press "Save"
      Then I should be on the dashboard page
      When I go to the blogs page
      Then I should see "Blog"
      And I should see "post title"
      When I follow "post title"
      Then I should be on the "post title" blog page
      When I go to the blogs page
      And I follow "Edit"
      Then I should be on the "post title" blog edit page
      When I fill in "post_title" with "post title2"
      And I press "Save"
      Then I should be on the "post title2" blog page
      When I go to the blogs page
      And I follow "Publish"
      Then I should be on the "post title2" published blog page
      When I go to the blogs page
      Then I should see "post title2"
      And I should not see "Publish"
      When I follow "Read More"
      Then I should be on the "post title2" published blog page



