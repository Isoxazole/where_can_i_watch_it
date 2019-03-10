Feature: Lockout
	When a user attempts to login too many times, they will be locked out of the account.

Scenario: The user enters an incorrect password
	Given the incorrect password was entered 5 times
	When the user attempts to log in again
	Then the user should be locked out of the account with the message "5 failed attempts. Account locked."

Scenario: The user enters the correct password
	Given the correct password is entered
	When the user clicks enter
	Then the user is granted access into the account
