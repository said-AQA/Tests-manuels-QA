# Login Test Cases

| ID | Scenario | Steps | Expected Result |
|----|----------|-------|----------------|
| TC01 | Valid login | Enter valid credentials | User logged in |
| TC02 | Invalid password | Wrong password | Error message |
| TC03 | Empty fields | Click login | Validation message |

# Login Test Cases

## Scope
These test cases verify the login functionality of the application, including valid authentication, validation errors, and negative scenarios.

## Preconditions
- The user has access to the login page
- A valid user account exists in the system
- Application is available and reachable

---

## Test Cases

| ID | Title | Preconditions | Test Steps | Test Data | Expected Result | Priority | Type | Related Bugs |
|----|-------|---------------|------------|-----------|-----------------|----------|------|--------------|
| TC_LOGIN_001 | Valid login with correct credentials | User account exists and is active | 1. Open login page<br>2. Enter valid email<br>3. Enter valid password<br>4. Click Login | Email: user@test.com<br>Password: Azerty!123 | User is successfully logged in and redirected to dashboard | P0 | Functional | [BUG_LOGIN_001](../bug-reports/login_button_not_working.md) |
| TC_LOGIN_002 | Login with invalid password | User account exists | 1. Open login page<br>2. Enter valid email<br>3. Enter invalid password<br>4. Click Login | Email: user@test.com<br>Password: WrongPass | Error message is displayed and user remains on login page | P0 | Negative |
| TC_LOGIN_003 | Login with empty fields | None | 1. Open login page<br>2. Leave email and password empty<br>3. Click Login | Empty fields | Validation messages are displayed for required fields | P1 | Validation |

---

## Additional Test Scenarios
The following test cases cover validation, negative, security, and UX scenarios.

| ID | Title | Preconditions | Test Steps | Test Data | Expected Result | Priority | Type |
|----|-------|---------------|------------|-----------|-----------------|----------|------|
| TC_LOGIN_004 | Login with invalid email format | None | 1. Open login page<br>2. Enter invalid email<br>3. Enter valid password<br>4. Click Login | Email: user@<br>Password: Azerty!123 | Validation error message is displayed | P1 | Validation |
| TC_LOGIN_005 | Login with email containing spaces | User account exists | 1. Open login page<br>2. Enter email with spaces<br>3. Enter valid password<br>4. Click Login | Email: " user@test.com " | Email is trimmed and user is logged in | P2 | Validation |
| TC_LOGIN_006 | Login with empty email field | None | 1. Open login page<br>2. Leave email empty<br>3. Enter valid password<br>4. Click Login | Email: empty<br>Password: Azerty!123 | Error message displayed for email field | P1 | Validation |
| TC_LOGIN_007 | Login with empty password field | None | 1. Open login page<br>2. Enter valid email<br>3. Leave password empty<br>4. Click Login | Email: user@test.com | Error message displayed for password field | P1 | Validation |

---

## Security & Robustness Test Cases

| ID | Title | Preconditions | Test Steps | Test Data | Expected Result | Priority | Type |
|----|-------|---------------|------------|-----------|-----------------|----------|------|
| TC_LOGIN_008 | Login with disabled account | User account is disabled | 1. Open login page<br>2. Enter valid credentials<br>3. Click Login | user@test.com / Azerty!123 | Access denied message is displayed | P0 | Security |
| TC_LOGIN_009 | Multiple failed login attempts | User account exists | 1. Enter wrong password multiple times | Wrong password x5 | Account is temporarily locked or warning displayed | P1 | Security |
| TC_LOGIN_010 | SQL injection attempt | None | 1. Enter SQL injection string<br>2. Click Login | `' OR 1=1 --` | Login is rejected and error is displayed | P0 | Security |

---

## Negative & Validation Test Cases

| ID | Title | Preconditions | Test Steps | Test Data | Expected Result | Priority | Type |
|----|-------|---------------|------------|-----------|-----------------|----------|------|
| TC_LOGIN_011 | Login with invalid email format (missing @) | None | 1. Open login page<br>2. Enter invalid email<br>3. Enter valid password<br>4. Click Login | Email: usertest.com<br>Password: Azerty!123 | Validation message is displayed and login is blocked | P1 | Validation |
| TC_LOGIN_012 | Login with invalid email format (missing domain) | None | 1. Open login page<br>2. Enter invalid email<br>3. Enter valid password<br>4. Click Login | Email: user@<br>Password: Azerty!123 | Validation message is displayed and login is blocked | P1 | Validation |
| TC_LOGIN_013 | Login with email containing leading/trailing spaces | User account exists and is active | 1. Open login page<br>2. Enter email with spaces<br>3. Enter valid password<br>4. Click Login | Email: "  user@test.com  "<br>Password: Azerty!123 | Email is trimmed and user is logged in successfully | P2 | Validation |
| TC_LOGIN_014 | Login with empty email and filled password | None | 1. Open login page<br>2. Leave email empty<br>3. Enter password<br>4. Click Login | Email: empty<br>Password: Azerty!123 | Email required validation message is displayed | P1 | Validation |
| TC_LOGIN_015 | Login with filled email and empty password | None | 1. Open login page<br>2. Enter valid email<br>3. Leave password empty<br>4. Click Login | Email: user@test.com<br>Password: empty | Password required validation message is displayed | P1 | Validation |
| TC_LOGIN_016 | Login with both fields empty | None | 1. Open login page<br>2. Leave email and password empty<br>3. Click Login | Email: empty<br>Password: empty | Validation messages are displayed for both required fields | P1 | Validation |
| TC_LOGIN_017 | Login with non-existing email | None | 1. Open login page<br>2. Enter non-existing email<br>3. Enter any password<br>4. Click Login | Email: unknown@test.com<br>Password: Azerty!123 | Error message is displayed and user remains on login page | P0 | Negative |
| TC_LOGIN_018 | Login with wrong password | User account exists and is active | 1. Open login page<br>2. Enter valid email<br>3. Enter wrong password<br>4. Click Login | Email: user@test.com<br>Password: WrongPass123 | Error message is displayed and no session is created | P0 | Negative |
| TC_LOGIN_019 | Login with password below minimum length | User account exists and password policy is enabled | 1. Open login page<br>2. Enter valid email<br>3. Enter short password<br>4. Click Login | Email: user@test.com<br>Password: 1a | Validation message is displayed (password policy) | P2 | Validation |
| TC_LOGIN_020 | Login with extremely long email input | None | 1. Open login page<br>2. Paste very long email string<br>3. Enter valid password<br>4. Click Login | Email: 256+ chars<br>Password: Azerty!123 | Input is handled safely (validation or limit) and no crash occurs | P2 | Robustness |

---

## UX & Accessibility Test Cases

| ID | Title | Preconditions | Test Steps | Test Data | Expected Result | Priority | Type |
|----|-------|---------------|------------|-----------|-----------------|----------|------|
| TC_LOGIN_021 | Login button disabled when fields are empty | None | 1. Open login page<br>2. Do not fill any field | N/A | Login button is disabled or user cannot submit the form | P2 | UX |
| TC_LOGIN_022 | Inline error messages are clear and visible | None | 1. Open login page<br>2. Click Login with empty fields | N/A | Error messages are readable, near the fields, and clearly explain what to fix | P2 | UX |
| TC_LOGIN_023 | Keyboard navigation (Tab order) works correctly | None | 1. Open login page<br>2. Use Tab key to navigate | N/A | Focus moves logically: Email → Password → Login button (no trap) | P2 | Accessibility |
| TC_LOGIN_024 | Focus is visible on inputs and button | None | 1. Open login page<br>2. Navigate with Tab | N/A | Focus indicator is clearly visible on each element | P2 | Accessibility |
| TC_LOGIN_025 | Press Enter submits the form when fields are valid | User account exists and is active | 1. Open login page<br>2. Fill valid email/password<br>3. Press Enter | user@test.com / Azerty!123 | Form is submitted and user is logged in successfully | P2 | UX |
| TC_LOGIN_026 | Error message is announced to screen readers (ARIA) | Screen reader available / accessibility mode | 1. Trigger a validation error (empty fields)<br>2. Observe screen reader output | N/A | Screen reader announces the error message (aria-live or equivalent) | P3 | Accessibility |
| TC_LOGIN_027 | Labels are associated to inputs | None | 1. Open login page<br>2. Inspect labels and fields | N/A | Each input has an accessible name (label/aria-label) | P3 | Accessibility |


