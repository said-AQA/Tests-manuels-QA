Feature: Login

  Scenario: Successful login with valid credentials
    Given the user is on the login page
    When the user enters valid credentials
    And clicks the Login button
    Then the user should be redirected to the dashboard

  Scenario: Login fails with invalid password
    Given the user is on the login page
    When the user enters a valid email and an invalid password
    And clicks the Login button
    Then an error message should be displayed

