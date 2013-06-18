Feature: Using contenteditable gem to edit content
  As an Admin user
  I want to change content and
  Make sure that it is saved

  Background:
    Given testuser_1@coshx.com is a valid admin

  @javascript
  Scenario: Edit and saving contenteditable
    And I sign in as "testuser_1@coshx.com" / "password_1"
    When I go to the home page
    And I should see contenteditable "slide1 title"
    And I change the content of "slide1 title" to "Hello world"
    And I save the contenteditable changes
    When I go to the home page
    And contenteditable "slide1 title" should be "Hello world"