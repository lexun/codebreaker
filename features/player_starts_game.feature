Feature: Start Game
  As a Player
  I want to start a game
  So that I can crack the code

  Scenario: From the command line
    Given I am not yet playing
    When I start a new game
    Then I should see "Welcome to Codebreaker!"
    And I should see "Enter guess:"
