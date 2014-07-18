Feature: Admin blog post functionality
  As an Admin user
  I want to post a new blog
  So that I can contribute to the rails community

  Background:
    Given testuser_1@coshx.com is a valid admin
    And the proper s3 data structure exists

  @javascript
  Scenario: Admin makes a blog post
    Given I sign in as "testuser_1@coshx.com" / "password_1"
    And twitter is configured
    Then I should be on the dashboard page
    And I should see "Admin Dashboard"
    When I follow "New Blog Post"
    Then I should be on the new blog post page
    And I should see "New Blog Post"
    When I fill in "post_title" with "post title"
    And I fill in "post_body" with "post body"
    And I attach a file for upload
    Then I should see "Insert Image"
    When I press "Place the image"
    Then I should see an image tag
    When I press "Save"
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

