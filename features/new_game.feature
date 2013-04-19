Feature: Start a game

So that I can experience the finely tuned, competitve sport of Tic-Tac-Toe (i.e. I love ties)
As a player
I want to be able to start a game and see an empty tic-tac-toe board, ready for my first move.

Scenario: Start a new game
    Given I am on the homepage
    When  I click on the New Game link
    Then I see a blank tic tac toe board
    And a box saying it's my turn