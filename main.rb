require_relative "storyCards.rb"
require_relative "game.rb"
#TODO - call necessary classes

#TODO - Start game

class Beyond_the_vale
    
    def initialize ()
       # puts "you called beyond the vale"
        getDestination(1)
    end

    def getDestination(cardNumber) #so this needs to call a function from a class that knows all the cards, where each function is an individual card
        
        #puts "I called number " + cardNumber.to_s
        Card1.new.startCard1
    end

end

#call the cards