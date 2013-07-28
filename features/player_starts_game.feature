Feature: Start Game
  As a Player
  I want to start a game
  So that I can crack the code

  The secret code for a new game should
  be a random 4 digit number by default

  Scenario: From the command line
    Given I am not yet playing
    When I start a new game
    Then I should see "Welcome to Codebreaker!"
    And I should see "Enter guess:"
    And the secret should be four random numbers
