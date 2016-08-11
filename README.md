# README

Welcome to Top.deck! I created this application because I wanted a way of tracking and visualizing my progress as a long-time player of Hearthstone. While this app pertains particularly to Hearthstone, it could easily be extrapolated and expanded to include other games, sports, or leisure activities. Really, anything you want to track and get a visual sense of progress in.

The three main models are: Players, Decks, and Match ups. You create a player, add decks to that player, and that add match ups to those decks. You can then track your wins and losses in the game at the microcosmic level by seeing what decks and what play styles you are winning against (or losing against) consistently.

As a User, you can also see graphical representations of your progress on each model level. For example, you can see how a certain deck is faring versus certain play styles, and then compare that to how all your decks are doing against those same play styles.

The major technologies/libraries used are:
1. Ruby on Rails 
2. Javascript (Highcharts)
3. SASS
4. Bootstrap for Styling
5. Active Record
6. Chartkick (Ruby Gem)

Much appreciation goes to Andrew Kane, creator of Chartkick, for creating an awesome Ruby based charting Gem.

In the future, I'd like to expand upon the cards model. I want Users to be able to search cards and add them to their decks through API calls. Then, they could see how decks with those particular cards are faring in the current game-meta. There is no official Hearthstone API yet, but one should be coming soon.

Enjoy!
