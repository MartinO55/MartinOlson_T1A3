require_relative "game.rb"

class StoryCard #this class is all the cards, including the endings, whose destinations have to be main menu
    
    attr_accessor :cardNumber, :cardText, :cardDestinations, :cardArtwork
    

    def initialize ()
         @cardNumber = cardNumber
    end

    def clearScreen ()
        puts "\e[H\e[2J"
    end


end

#TODO - holds the list of all the cards

class Card1 < StoryCard
    
    def startCard1()
    puts "\n        It was already a freezing morning when you set out for the legendary “Castle of Madness” – the mysterious castle that is said to emerge 
    from blizzards once every seven winters.\n\n    Now, as it grows dark, the mountains’ glacial winds of this valley make the temperature 
    seem hundreds of times colder. Both hands wrap your winter cloak tightly around your body, but somehow you can still feel the icesharded winds as if on bare skin.
    \n        You squint your eyes down at your weapon and wonder if it has become frozen to your belt. Nothing alive can possibly live in these 
    temperatures, you reassure yourself, pushing back thoughts of the living dead you’ve heard emerge with the castle.
    \n        Soon, you can make out the faint ruined form of the castle up ahead. The old crone’s rotting map was right! Your best guess tells 
    you it’s another hour’s walk in the harsh cold. Before you have time to think about the longer walk, you spot a gaping black opening in 
    the snow. It must be a cave. The crone told you that underground tunnels could also lead into the castle. \n\n      Could this be one? Or is it the lair of some beast \n\n" #this needs to be the formatted story text

    puts "What do you want to do?""\n\n" #this needs to be the list of things you could do
        puts "if you want to explore the cave, type 1""\n\n"
        puts "if you want to continue on your cold trek to the castle type (undefined)"

    @cardDestinations= gets.chomp.to_i #this is the input
        
        if cardDestinations ==1 #this is each of the possible choices, and will have an else for each possible destination
            Card12.new.startCard12#this calls the destination card
        else cardDestinations ==2
        end

    end
end

class Card2 < StoryCard
    def startCard2() #this needs to clear the screen
        clearScreen()
    puts "card 2"
    end
end

class Card3 <StoryCard
    def startCard3() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card4 <StoryCard
    def startCard4() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card5 <StoryCard
    def startCard5() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card6 <StoryCard
    def startCard6() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card7 <StoryCard
    def startCard7() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card8 <StoryCard
    def startCard8() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card9 <StoryCard
    def startCard9() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card10 <StoryCard
    def startCard10() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card11 <StoryCard
    def startCard11() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card12 <StoryCard
    def startCard12()
        clearScreen()
        puts "card 12"
    end
end

class Card13 <StoryCard
    def startCard13() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card14 <StoryCard
    def startCard14() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card15 <StoryCard
    def startCard15() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card16 <StoryCard
    def startCard16() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card17 <StoryCard
    def startCard17() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card18 <StoryCard
    def startCard18() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card19 <StoryCard
    def startCard19() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card20 <StoryCard
    def startCard20() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card21 <StoryCard
    def startCard21() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card22 <StoryCard
    def startCard22() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end
class Card23 <StoryCard
    def startCard23() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card24 <StoryCard
    def startCard24() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end
class Card25 <StoryCard
    def startCard25() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end
class Card26 <StoryCard
    def startCard26() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end
class Card27 <StoryCard
    def startCard27() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end
class Card28 <StoryCard
    def startCard28() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end
class Card29 <StoryCard
    def startCard29() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end
class Card30 <StoryCard
    def startCard30() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end
class Card31 <StoryCard
    def startCard31() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end
class Card32 <StoryCard
    def startCard32() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end
class Card33 <StoryCard
    def startCard33() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end
class Card34 <StoryCard
    def startCard34() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end
class Card35 <StoryCard
    def startCard35() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end
class Card36 <StoryCard
    def startCard36() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end
class Card37 <StoryCard
    def startCard37() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end
class Card60 < StoryCard
    def startCard60()
        clearScreen()
        puts "card 60"
    end
end
