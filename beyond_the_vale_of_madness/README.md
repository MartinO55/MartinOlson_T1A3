# BeyondTheValeOfMadness

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/beyond_the_vale_of_madness`. To experiment with that code, run `bin/console` for an interactive prompt.

This gem is an implementation of the GURPS Fantasy adventure "Beyond the Vale of Madness" by JC Connors, submitted as part of the requirements for Coder Academys fast track course subjects CMP1041 - Foundation Programming, and PRG1002 - Programming I.

Solo Adventures - Beyond the Vale of Madness, 2020. One shot adventures. URL <https://1shotadventures.com/solo-adventures-beyond-the-vale-of-madness/> (accessed 10.1.21).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'beyond_the_vale_of_madness'
```

And then execute:

bundle install

Or install it yourself as:

gem install beyond_the_vale_of_madness

## Usage

After installing the gem, select the new game option, then follow the instructions on screen, making choices as prompted. To make a choice type in the appropriate number and press enter.

## Software Development Plan

### High Level Overview

This application will implement the GURPS (Generalised Universal Roleplaying System) Fantasy solo adventure “Beyond the vale of madness” by J.C. Connors as a text-based adventure game in a ruby terminal application. The scope for this project will be to fully implement the story as told by this adventure module as a text-based adventure that is fully playable through all possible outcomes with at least one pre generated character. The module will then be published as a ruby gem to allow anyone (with a working ruby installation) to access it. Dice rolling mechanics are implemented using the gem "crapshoot". ASCII text is implemented using the gem "Artii", text colours are implemented using the gem "Colourize", and the main menu prompt is implemented using "TTY-prompt". The initial version as deployed here as a beta 'version 0.1', lacks ASCII art due to time constraints, but it is hoped that this can be implemented in future using the gems "rmagick" and "TCO" in order to aid the player in visualising the experience dynamically, using the rmagick and tco gems to convert images to ASCII format that can be displayed in terminal.

### Identify the Problem This Gem Will Solve

The problems this application will solve are twofold. Firstly, it will help combat boredom among the relatively small subset of the population with the desire and ability and use ruby gems to download games, particularly those of the text-based adventure genre. The second problem it will solve is the distinct lack of this GURPS module existing as a computer game.I have chosen to develop this game as a tribute to past adventure games from the early days of computergaming, as well as some of the tabletop role playing adventures of yore. The goal is to provide the user with a fun experience with which to occupy their time.

### Target Audience

The target audience for this application is anyone with access to ruby gems who wishes to play a short text-based adventure game using the GURPS/Choose your own adventure format, or has played this type of game before and wishes to experience a new one. This gem will aim to be fun for both people who are familiar with tabletop roll playing games and those who are familiar with computer games. The game mechanics will be easily accessible to those familiar with computer games and those unfamiliar with them, as the mechanics as implemented are simple to use and understand.

### How the Target Audience Will Use It

The target audience for this application will access it as a standard ruby gem through the Linux terminal setup and gem management software. The game will open with a main menu screen showing new game, load game and quit options. The game will be played as a text-based adventure, with the players advancing through the story by making choices as prompted, with these choices affecting progression and the overall outcome of the players’ adventure. It will be a relatively short adventure using the premade characters included as part of the original module, with several possible outcomes, but those limited by the possible outcomes of the module. In addition, in a future version, it is hoped to be able to create and implement a save function that enables a user to have their progress saved automatically, returning to the game at a later date.

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Features

The adventure as published is a choose-your own-adventure style book, with each story beat being confined to its own paragraph, with the player making a choice of which path to take, with the outcome of that path being based on a skill check as taken by the player, a combat encounter with a set enemy, or another player choice. This style of adventure is notable for the ability to be replayed several times with different outcomes, however it is susceptible to unintended ‘cheating’ by the player as they can accidentally read ahead, discovering future story beats and choices by accident. By implementing the story as a computer game, it is possible to remove this issue, while maintaining the other advantages.

This game includes GURPS style skill checks, combat encounters and progression through a hand-crafted solo adventure. GURPS skill checks and combat mechanics are all based around rolling six-sided dice, with three dice required for most checks. Skill check mechanics involve rolling three of these dice, adding the total together and comparing the result to the relevant player skill, with a pass being rolling lower or equal to the profile score, and a failure being rolling greater than this number. Combat is implemented in the same way, with players having to roll below their dexterity score to secure a hit, the target having to roll above their blocking score to fail to block, and then damage being inflicted based on the weapon being used, often being randomised with dice. In all cases, the 'dice' are rolled behind the screen, so the player is unable to see what numbers are rolled, increasing immersion. In the unlikley event the crapshoot gem fails to produce a valid input the code cause it to dump the result.

Throughout the adventure, the player can find and collect items of loot that take the form of either 'powerups', that improve various player stats, to other items that are sold at the end of the adventure to give players a measure of how well they managed during the adventure. These items of loot not ownly improve the players performance, they also help to tell the story of the module and the castle of madness. These loot items are stored in on the players character, and at the end of the module are sold for silver that gives the player a final score for the module, giving them the opportunity to play through again and attempt to beat that score. In addition, all of this implementation is done with an eye towards future proofing the application, making it possible in future to implement possiblities like custom character creation, additional combat encounters with different enemies.

All of the above features are implemented using conditional loops that implement either sending the player to the appropriate destination via the appropriate skill checks or combat encounters if relevant, and also handle issues with the player entering an incorrect number. In some cases, ‘tty-prompt’ is used to ensure that there is no option for the player to enter incorrect data. Data entry errors by the user are handled internally behind the scenes, with the choice either being re-presented to the player again, or a default path being implemented. In cases of skill checks where no player input is required, errors should not occur, but the logic still allows for it to happen and the program exits gracefully.

The flow of the application can be seen in the .png flowchart as below, which details the structure of how the game will function.
![Flow diagram showing how the application math functions, and where and when various methods are called, as well as the impacts they have](docs/T1A3_logic_flowchart_draft_1.png"flowchart of Beyond the vale of Madness")

## Implementation plan

Progress was tracked throughout development using a kanban board created using the free version of Trello. What follow are a series of screen shots of this trello board taken over the week the progject was under development, detailing units of work that still needed to be done, those in progress, and those that had been completed.

![kanban board screen shot from september 23 detailing progress](docs/KanbanBoardShots/KanbanBoardT1A3_23Sept.png"september 23 kanban board")

![kanban board screen shot from september 24 detailing progress](docs/KanbanBoardShots/KanbanBoardT1A3_24Sept.png"september 24 kanban board")

![kanban board screen shot detailing progress on september 25, taken on september 26](docs/KanbanBoardShots/KanbanBoardT1A3_26Sept1.png"september 25 kanban board")

![kanban board screen shot detailing progress on september 26, taken on september 27](docs/KanbanBoardShots/KanbanBoardT1A3_27Sept1.png"september 26 kanban board")

![kanban board screen shot detailing progress on september 27 and 28, taken on september 29](docs/KanbanBoardShots/KanbanBoardT1A3_29Sept1.png"september 28 kanban board")

![kanban board screen shot detailing progress on september 29 and 30, taken on october 1](docs/KanbanBoardShots/KanbanBoardT1A3_1Oct1.png"october 1 kanban board")

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/[USERNAME>]/beyond_the_vale_of_madness. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/beyond_the_vale_of_madness/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the BeyondTheValeOfMadness project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/beyond_the_vale_of_madness/blob/master/CODE_OF_CONDUCT.md).
