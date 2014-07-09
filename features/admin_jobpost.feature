@wip
Feature: Admin job post functionality
  As an Admin user
  I want to administer job openings
  So that I advocate for a new team member

  Background:
    Given testuser_1@coshx.com is a valid admin
    And there are no jobs

  Scenario: Admin makes job post
    Given I am not authenticated
    And I sign in as "testuser_1@coshx.com" / "password_1"
    Then I should be on the dashboard page
    When I follow "New Job Posting"
    Then I should be on the new job post page
    And I should see "New Job Posting"
    When I fill in "job_title" with "job title"
    And I fill in "job_description" with "job description"
    And I press "Save"
    Then I should be on the "job title" job page
    When I go to the careers page
    Then I should see "We're Hiring!"
    And I should see "Open Positions"
    And I should see "job title"
    When I follow "job title"
    Then I should be on the "job title" job page
    When I go to the careers page
    And I follow "Publish"
    Then I should be on the careers page
    And I should not see "Publish"
    And I follow "Edit"
    Then I should be on the "job title" job edit page
    When I fill in "job_title" with "job title2"
    And I fill in "job_blog_url" with "www.google.com"
    And I check "job_filled"
    And I press "Save"
    Then I should be on the "job title" job page
    When I go to the careers page
    Then I should see "job title2"
    And I should see "www.google.com"
    And I should see "Filled Positions"
    And I should see "Interested in working at Coshx?"
    And I should not see "Open Positions"

