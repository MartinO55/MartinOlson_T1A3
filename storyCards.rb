require_relative "game.rb"

class StoryCard #this class is all the cards, including the endings, whose destinations have to be main menu
    
    attr_accessor :cardNumber, :cardText, :cardDestinations, :cardArtwork
    

    def initialize ()
       @cardNumber = cardNumber
       @cardDestinations = cardDestinations
    end

    def clearScreen ()
        puts "\e[H\e[2J"
    end

    def getNextCard (cardDestinations) #now offloaded to parent class. its something.jpg
        @cardDestinations = gets.chomp.to_i
        return @cardDestinations
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

           getNextCard(cardDestinations)
         #   @cardDestinations = gets.chomp.to_i #this is the input.#now moved to parent class
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

            getNextCard(cardDestinations)
           # @cardDestinations = gets.chomp.to_i

            if cardDestinations ==1
                Card14.new.startCard14
            else cardDestinations ==2
                Card11.new.startCard11
            end
        end
    end

    class Card3 <StoryCard
        def startCard3() 
            clearScreen()
            puts "Snow crunching underfoot, you jog along the intact half of the castle.\n\nJust as you begin to tire, you spot a broken gateway, where once armored guards stood with tall halberds. The portal lies open and shattered and leads into the courtyard of the castle.\n\n
            You swing under the broken gate and look around. Dozens of statues – most crumbled – litter the courtyard. You see two doors beyond the statue graveyard.\nThe smaller one seems to be a servant’s entrance; the other seems to be a guardhouse door"
            puts "What will you do now?"
            puts "[1] Search the courtyard\n"
            puts "[2] Go through the servants door\n"
            puts "[3] Go through to the Guardhouse\n"

            getNextCard(cardDestinations)
           # @cardDestinations = gets.chomp.to_i

            if cardDestinations == 1
                Card43.new.startCard43
            elsif cardDestinations == 2
                Card14.new.startCard14
            else cardDestinations == 3
                Card11.new.startCard11
            end
        end
    end

    class Card4 <StoryCard
        def startCard4() #
            clearScreen()
            puts "You see a woman, half-dressed, standing in the room. Her skin is icy pale. \nShe picks up the remnants of her clothes and stares at you, her ice blue eyes burning into the back of your head. \n\nBefore you can even wonder about the true nature of this delicate creature, she disappears in a flurry of fine ice. \nYou shake your head and enter the room"
            puts "..."
            puts "[1] Continue"

            getNextCard(cardDestinations)
           # @cardDestinations = gets.chomp.to_i

            if cardDestinations ==1
                Card45.new.startCard45
            end
        end
    end

    class Card5 <StoryCard
        def startCard5() 
            clearScreen()
            puts "You manage to loop the grapple around the gargoyle’s wing. Confident in your skill, you begin the treacherous climb.\n\nCRACK!\n\n The gargoyle breaks away and you plummet to the snowy ground.\n\nTending your sore arm from the fall, you decide to circle around the castle and look for another way in."
            puts "..."
            puts "[1] Continue"
            #add Fall damage, and emphasis on the CRACK
    #The fall does 1d-1 cr damage, with only soft armor protecting.
            getNextCard(cardDestinations)
            #@cardDestinations = gets.chomp.to_i
            if cardDestinations ==1
                Card3.new.startCard3
            end
        end
    end

    class Card6 <StoryCard
        def startCard6() 
            clearScreen()
        puts "As you are about to leave, you spot a tarnished, silver ring on one of the skeletons.\nYou pull it off and examine it. Apparently, it was the captain of the guard’s signet ring.\nPocketing it, you head out the door for the servant’s entrance"
        puts "..."
        puts "[1] Continue..."

        getNextCard(cardDestinations)
       # @cardDestinations = gets.chomp.to_i
        if cardDestinations ==1
            Card14.new.startCard14
        end
        end
    end

    class Card7 <StoryCard
        def startCard7() 
            clearScreen()
        puts "You stride forward with confidence and crack open the half-broken door but quickly realize that you can’t see – it’s too dark to make out anything but dim silhouettes.\n\nYou fumble to get a torch lit as you hear a hissing cackle that chills your bones."
        puts "..."# this needs to be replaced with the pass/fail skill check that adds a modifier to the next destination
        puts "[1] Continue"

        getNextCard(cardDestinations)
        #@cardDestinations = gets.chomp.to_i
            if cardDestinations ==1
                Card38.new.startCard38
            end
        end

    end

 class Card8 <StoryCard
    def startCard8() 
         clearScreen()
     puts "You’re in luck – the strange monster is too busy with his meal to notice you.\n\nYou glance around the icy room and notice that there is a small tunnel that continues past the creature.\nWith any luck, you can get to it without him noticing you."
    puts "Now What?"
    puts "[1] Try to sneak past"
    puts "[2] Turn around"
    puts "[3] ATTACK!"

    getNextCard(cardDestinations)
       if cardDestinations == 1
           Card44.new.startCard44
       elsif cardDestinations == 2
           Card22.new.startCard22
       else cardDestinations == 3
           Card17.new.startcard17
       end
    end
 end

 class Card9 <StoryCard
    def startCard9() 
         clearScreen()
     puts "As you quietly move along the dark tunnel, you hear a disgusting noise from up ahead.\nYou hear pained squeals and horrible rending sounds about forty paces in front of you.\n\nYour skin crawls at the thought of what lies ahead."
    puts "Now what?"
    puts "[1] Turn around and go back the other way"
    puts "[2] Sneak on ahead"
    puts "[3] CHARGE!!!"

    getNextCard(cardDestinations)
        if cardDestinations ==1
            Card22.new.startCard22
        elsif cardDestinations ==2
            Card31.new.startCard31
        else cardDestinations ==3
            Card49.new.startCard49
        end
    end
 end

 class Card10 <StoryCard
     def startCard10() 
         clearScreen()#this card has a strength check, and also checks fatigue
     puts "You dash past the creature into the smaller tunnel beyond him. You quickly jog down the cavern leaving the disgusting crunching noise behind you.\n\nThe tunnel winds its way for about twenty minutes until you can make out a bright white light from up ahead. When you come to this exit, you notice a thick layer of snow covering the cave opening.\n\nYou pull out your weapon and start digging.\nYour heart is pounding.\nSuddenly, from behind you, you hear the roar of the ice troll.\n\nDig faster!"
     puts "continue... (quickly)" #add fatigue
     puts "[1] dig, Dig, DIG!!" # make a strength check
     getNextCard(cardDestinations) #this is a gets.chomp, and it needs to be a dice roll
     if cardDestinations == 1 #pass
         Card26.new.startCard26
     else cardDestinations == 2 #fail
         Card20.new.startCard20
     end
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

       # @cardDestinations= gets.chomp.to_i
        getNextCard(cardDestinations)
            if cardDestinations == 1
                Card9.new.startCard9
            elsif cardDestinations == 2
                Card22.new.startCard22
            else cardDestinations == 3
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
