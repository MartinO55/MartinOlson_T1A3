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
    puts "\nIt was already a freezing morning when you set out for the legendary “Castle of Madness” – the mysterious castle that is said to emerge from blizzards once every seven winters.\n\nNow, as it grows dark, the mountains’ glacial winds of this valley make the temperature seem hundreds of times colder. \n\nBoth hands wrap your winter cloak tightly around your body, but somehow you can still feel the ice-sharded winds as if on bare skin.\nYou squint your eyes down at your weapon and wonder if it has become frozen to your belt. 
    \nNothing alive can possibly live in these temperatures, you reassure yourself, pushing back thoughts of the living dead you’ve heard emerge with the castle.\n\nSoon, you can make out the faint ruined form of the castle up ahead. The old crone’s rotting map was right! Your best guess tells you it’s another hour’s walk in the harsh cold. \nBefore you have time to think about the longer walk, you spot a gaping black opening in the snow. It must be a cave. The crone told you that underground tunnels could also lead into the castle.\n\nCould this be one? Or is it the lair of some beast \n\n" #this needs to be the formatted story text

    puts "What do you want to do?""\n\n" #this needs to be the list of things you could do
        puts "[1] Explore the cave\n\n"
        puts "[2] Continue on your cold trek to the castle"

    @cardDestinations= gets.chomp.to_i #this is the input
        
        if cardDestinations ==1 #this is each of the possible choices, and will have an else for each possible destination
            Card12.new.startCard12#this calls the destination card
        else cardDestinations ==2
            Card19.new.startCard19
        end

    end
end

class Card2 < StoryCard
    def startCard2() #this needs to clear the screen
        clearScreen()

    puts "Double-wrapping your hands to protect them from the cold, you dig under some broken statues. In a few minutes you’ve uncovered a beautiful antique mace, its metal head coated in an unusual blue lacquer.\n\n
    Digging some more, you realize something – the weapon still has a frozen hand attached to it! A second later, your boot brushes aside the remains of the man’s face! The blue skin is cracked and broken. Apparently, some warrior died wielding this mace\n\n"
    
    #add a skill check to take the mace

    puts "Which way now?"
    puts "[1] Through the servants door\n"
    puts "[2] Through the Guardhouse\n"

    @cardDestinations = gets.chomp.to_i

    if cardDestinations ==1
        Card14.new.startCard14
    else cardDestinations ==2
        Card11.new.startCard11
    end
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
        puts "It feels warmer the moment you step into the cave, though the winds make an eerie whining sound throughout these dark tunnels. \n\nFortunately, you had enough foresight to bring a torch.\n\nStretching your numb fingers several times, you take out your tinderbox and light the torch.\nThe heat seems to melt your very face. Taking a deep breath, you walk down the winding tunnels making mental notes of its rock formations in case you get lost.\nIt seems as if someone, or something, walked these tunnels in the recent weeks. In a few minutes, you see that the tunnel turns and branches"
        puts "Which path do you take?""\n\n"
        puts "[1] The trodden path"
        puts "[2] The icier path"
        puts "[3] The warmer, rock path"
        @cardDestinations= gets.chomp.to_i
            if cardDestinations ==1
                Card9.new.startCard9
            elsif cardDestinations ==2
                Card22.new.startCard22
            else cardDestinations ==3
                Card54.new.startCard54
            end
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

class Card38 <StoryCard
    def startCard38() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card39 <StoryCard
    def startCard39() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card40 <StoryCard
    def startCard40() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card41 <StoryCard
    def startCard41() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card42 <StoryCard
    def startCard42() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card43 <StoryCard
    def startCard43() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card44 <StoryCard
    def startCard44() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card45 <StoryCard
    def startCard45() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card46 <StoryCard
    def startCard46() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card47 <StoryCard
    def startCard47() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card48 <StoryCard
    def startCard48() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card49 <StoryCard
    def startCard49() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card50 <StoryCard
    def startCard50() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card51 <StoryCard
    def startCard51() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card52 <StoryCard
    def startCard52() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card53 <StoryCard
    def startCard53() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card54 <StoryCard
    def startCard54() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card55 <StoryCard
    def startCard55() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card56 <StoryCard
    def startCard56() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card57 <StoryCard
    def startCard57() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card58 <StoryCard
    def startCard58() #this needs to clear the screen
        clearScreen()
    puts ""
    end
end

class Card60 <StoryCard
    def startCard60() #this needs to clear the screen
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
