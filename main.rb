

require_relative "storyCards.rb"
require_relative "game.rb"
require_relative "characters.rb"
#require_relative "playercharacter.rb"
#TODO - call necessary classes

#TODO - Start game

class Beyond_the_vale
    
    def initialize ()
      #  puts "you called beyond the vale"
        Card10.new.startCard10
       # getDestination(1)

    end

    def getDestination(cardNumber) #so this needs to call a function from a class that knows all the cards, where each function is an individual card
        
       # puts "I called number " + cardNumber.to_s
        
    end

    def callCombat()

    end

    #TODO Game over function

end

#call the cards - moved to the cards themselves
