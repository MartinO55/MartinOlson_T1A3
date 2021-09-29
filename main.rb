
#this file exists to serve as an intermediary between main_menu and the story, because it apparently needs one (don't know why, won't wuestion it again)
require_relative "storyCards.rb"
require_relative "game.rb"
require_relative "characters.rb"

#TODO - call necessary classes

#TODO - Start game

class Beyond_the_vale
    
    def initialize ()
      #  puts "you called beyond the vale"
      #if you take the name from the main menu, push it to the player character object and use that as an autosave function?
        Card1.new.startCard1
       # getDestination(1)
    end
end

def loadGame(cardNumber) #so this needs to call a function from a class that knows all the cards, where each function is an individual card
        #this needs to concatanate cardnumber with Card to tell it where to go
      cardToLoad = "Card" +cardNumber.to_s
       # puts "I called number " + cardNumber.to_s
        
end

def callCombat()

end

#TODO Game over function
class GAME_OVER
  def initialize()
    
  end

end
#call the cards - moved to the cards themselves
