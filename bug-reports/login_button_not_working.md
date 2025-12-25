# Bug Report

## Bug ID
BUG_LOGIN_001

## Title
Login button does not respond when clicking with valid credentials

## Module / Feature
Authentication – Login

## Environment
- Application: Web App
- URL: https://example.com/login
- Browser: Google Chrome 124.0
- OS: Windows 10
- Device: Desktop

## Build / Version
v1.0.0 (Staging)

## Preconditions
- User is on the login page
- User account exists and is active

## Steps to Reproduce
1. Open the login page
2. Enter a valid email and password
3. Click on the **Login** button

## Test Data
- Email: user@test.com  
- Password: Azerty!123

## Expected Result
User should be authenticated and redirected to the dashboard page.

## Actual Result
Clicking the Login button has no effect.  
No redirection, no error message, and no visible feedback.

## Reproducibility
Always

## Severity
High (S1 – Blocks user login)

## Priority
High (P0 – Must be fixed before release)

## Impact
Users are unable to log in, blocking access to the application.

## Test Case Reference
TC_LOGIN_001

## Attachments
- Screenshot: login_button_no_response.png
- Video: login_button_click_issue.mp4
- Console logs (if any)

## Workaround
None

## Status
Open
