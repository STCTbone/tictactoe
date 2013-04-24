Feature: Game Moves
  So that I can continue the game
  As a player
  I want to be able to make my next tic-tac-toe move, and have the AI make the optimal counter-move

  Scenario: Player makes a move
    Given I am playing a game and it is my turn
    When I click on an unoccupied square
    Then that square is filled with an "O"