Feature: Admin BHAG (Big Hairy Audacious Goal)
  As a Coshx Developer
  I want to keep track of awesome ideas
  So we can hack on them and use them

Background:
  Given testuser_1@coshx.com is a valid admin
  And there are no ideas
  And I sign in as "testuser_1@coshx.com" / "password_1"

Scenario: Admin Link
  Then I should see "Admin Dashboard"
  And I should see "New Idea"

Scenario: Adding an Idea
  When I follow "New Idea"
  And I submit a new idea
  Then I should see the new idea
