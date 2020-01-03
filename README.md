# Concentration Card Game

Concentration (or Pairs) is a card game in which all of the cards are laid face down on a surface and two cards are flipped face up over each turn. The objective of the game is to turn over pairs of matching cards.
<p align="center">
  <img height="400" src="https://media.giphy.com/media/lQ1P43zyRLoDpOYBp8/giphy.gif">
  <br>
</p>


## Learning Goals
- Learning iOs app development
- Getting experience creating a project in Xcode and typing code in from scratch


## Running
- Might require Xcode 11
- Open project, change the bundle identifier to an identifier linked to your Apple developer account in order to run.1

## Requirements
1.  Create a working game with 10 pairs of shuffled cards
1.  Add more cards to the game.
1.  Add a “New Game” button to your UI which ends the current game in progress and
begins a brand new game.
1.  Currently the cards in the Model are not randomized (that’s why matching cards end
up always in the same place in our UI). Shuffle the cards in Concentration’s init()
method.
1.  Give your game the concept of a “theme”. A theme determines the set of emoji from
which cards are chosen. All emoji in a given theme are related by that theme. See the
Hints for example themes. Your game should have at least 6 different themes and
should choose a random theme each time a new game starts.
1.  Your architecture must make it possible to add a new theme in a single line of code.
1.  Add a game score label to your UI. Score the game by giving 2 points for every match
and penalizing 1 point for every previously seen card that is involved in a mismatch.
1.  Tracking the flip count almost certainly does not belong in your Controller in a proper
MVC architecture. Fix that.
1.  All new UI you add should be nicely laid out and look good in portrait mode on an
iPhone X.
