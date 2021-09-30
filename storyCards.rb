require_relative "game.rb" #this is where the skill checks and probably comat will go
require_relative "characters.rb" #this is where inventory will need to be pushed to
#require_relative "main_menu.rb"  #SO this breaks the app
require "colorize"
require "colorized_string"
require "yaml"
#require "tty-prompt" #dont do it it doesn't work, it just breaks everything and I don't know why
#maybe tty prompt#NO NOT AGAIN NEVER AGAIN
#ascii_paradise for ascii animations

class StoryCard #this class is all the cards, including the endings, whose destinations have to be main menu
    
    attr_accessor :cardNumber, :cardText, :cardDestinations, :cardArtwork, :goToMainMenu, :quitNow
    

    def initialize ()
       @cardNumber = cardNumber
       @cardDestinations = cardDestinations
       @goToMainMenu = goToMainMenu
       @quitNow = quitNow
    end

    def autoSave(cardNumberSaved)
        playerSave = Player.name
        cardnumber = cardNumberSaved
       # loot = Player.loot
            File.open("saveGame.yaml","r+") do |f|
                f.write(cardNumber.to_yaml)
            end

    end

    def clearScreen ()
        puts "\e[H\e[2J"#this clears the screen. it seemed like the easiest solution I could fine. this could probablly be replaced with a gem if needed
    end

    def getNextCard (cardDestinations) #now offloaded to parent class. its something.jpg
        @cardDestinations = gets.chomp.to_i
        return @cardDestinations
    end

    def manageCombat(enemy,player)#this the mehtod called by cards where combat take place - passing the method the enemy mob to fight and the player character
        puts "you are in a fight with a hideous creature\n\n".colorize(:red) #so if you try to call the enemy here you get the memory reference
            #Combat loop - while both the player and enemy are alive, the attack sequence continues with the player going first
        if player.loot.include? "Bear Shield" #shield does shield thinds
                player.damageBlock +=3
        end

            while player.hitpoints >0 && enemy.hitpoints >0 #both are alive
                
                puts "[1] ATTACK!\n\n".colorize(:red)
                attackQueue = gets.chomp.to_i #breaks the sequence

                    playerDamgeReduction = player.damageReduction#initialize the damage reduction stats
                       
                    enemyDamageReduction = enemy.damageReduction

                    playerAttackDamageMid = player.attack  #this is supposed to call the player variable passed to this method, which is the Player, which has a method attack (which provides damage)
                    playerDamageMod =1
                    
                        if player.loot.include? "Antique Mace" #mace does mace things
                            playerDamageMod = 3
                        end

                    playerAttackDamage = playerAttackDamageMid -enemyDamageReduction + playerDamageMod #applies enemy DR
                    
                playerRollToHit = CombatRolls.new.rollToHit
                enemyRollToBlock = CombatRolls.new.rollToBlock
                #Players Attack sequence
                    if playerRollToHit == 3
                        puts "You score a Critical hit!!\n\n"
                        enemy.hitpoints -= playerAttackDamage #no chance to block, go straight to damage
                    elsif playerRollToHit > player.dexterity #Player Rolls to hit
                        puts "you missed the target!!\n\n"
                    else playerRollToHit <= player.dexterity
                        if enemyRollToBlock >enemy.damageBlock #enemy rolls to dodge
                            enemy.hitpoints -= playerAttackDamage #player does damage
                            puts "You hit the enemy with your weapon!!"
                            puts "enemy health is"
                            puts enemy.hitpoints
                        else enemyRollToBlock <= enemyRollToBlock
                            puts "The enemy dodges your attack!!"
                        end
                    end

                    enemyAttackDamageMid = enemy.attack # rolls the dice
                    enemyAttackDamage=enemyAttackDamageMid-playerDamgeReduction #applies player DR
                
                enemyRollToHit = CombatRolls.new.rollToHit #enemy rolls to hit
                playerRollToBlock = CombatRolls.new.rollToBlock
                    #enemy Attack sequence
                    if enemyRollToHit == 3
                        puts "Your enemy scores a critical hit!!"
                        player.hitpoints -= enemyAttackDamage #enemy does damage, no blocking allowed
                    elsif enemyRollToHit > enemy.dexterity
                        puts "Your enemy fails to hit you!!"
                    else enemyRollToHit<=enemy.dexterity
                        #now you get to roll to dodge/block/parry - in GURPS there are these 3 options, but because it's just roll under the number, you would always pick your best option, and nothing in the module disallows any choice so, theres only one
                        if playerRollToBlock >player.damageBlock#roll to block
                            player.hitpoints -= enemyAttackDamage #enemy does damage
                            puts "Enemy Hits you!!. It really hurts!!"
                            puts "player health is"
                            puts player.hitpoints
                        else playerRollToBlock <= player.damageBlock
                            puts "You dodge the enemies attack!!"
                        end
                    end
        end
    end

    def pushLoot(lootToPush)
        lootArray = Player.loot
       #puts lootArray
        lootArray << lootToPush
       #puts lootArray
    end

    def pushInventory(item) #strictly speaking this is no longer necessary, its here for future proofing
        inventory = Player.inventory #Okay we tried this as a hash, it was stupid, is now an array
      # puts inventory
        inventory << item
      # puts inventory
    end

    def countLoot()#so there are a number of different ways this could be done - this could just be a long function in card 60, this could take in the players inventory and loot as variables passed to the method...
        #if I had defined these as hashes, this method would be shorter, but the push functions longer... so yeah.
        cashEarned =0
        loot = Player.loot
        while loot.length >0
            if loot.include? "Antique Mace"
                cashEarned += 80
                loot.delete ("Antique Mace")
            elsif loot.include? "Troll Teeth"
                cashEarned += 15
                loot.delete ("Troll Teeth")
            elsif loot.include? "Amythest Ring"
                cashEarned += 200
                loot.delete ("Amythest Ring")
            elsif loot.include? "Jrak Kull"
                cashEarned += 500
                loot.delete ("Jrak Kull")
            elsif loot.include? "Maiden Tapestry"
                cashEarned += 100
                loot.delete ("Maiden Tapestry")
            elsif loot.include? "Axe Tapestry"
                cashEarned += 10
                loot.delete ("Axe Tapestry")
            elsif loot.include? "Signet Ring"
                cashEarned += 150
                loot.delete ("Signet Ring")
            elsif loot.include? "Bear Shield"
                cashEarned += 100
                loot.delete ("Bear Shield")
            elsif loot.include? "Glass Dagger"
                cashEarned += 50
                loot.delete ("Glass Dagger")
            elsif loot.include? "Crossbow"
                cashEarned += 150
                loot.delete ("Crossbow")
            elsif loot.include? "Silver Tiara"
                cashEarned +=300
                loot.delete ("Silver Tiara")
            elsif loot.include? "Blue Chemise"
                cashEarned += 20
                loot.delete ("Blue Chemise")
            elsif loot.include? "Chariot Toy"
                cashEarned += 25
                loot.delete ("Chariot Toy")
            else loot.include? "Glass Sceptre"
                cashEarned += 400
                loot.delete ("Glass Sceptre")
            end
        end
        if cashEarned > 0
            puts "Your adventure earned you #{cashEarned} silver\n\n"    
        else
            puts "You have escaped with your life, but little of value\n\n"
        end
        #puts cashEarned
        return cashEarned
    end

end

#TODO - holds the list of all the cards
#TODO - refactor all the data to a yaml file at some point
    class Card1 < StoryCard
        
        def startCard1()#So we could write a universal method in the parent class that takes the card number
            clearScreen()
            autoSave(1)
            #pushLoot("testItem")
            # pushLoot("testitem2")
            #testitem = "testloot"
           
        puts "\nIt was already a freezing morning when you set out for the legendary “Castle of Madness” – the mysterious castle that is said to emerge from blizzards once every seven winters.\n\nNow, as it grows dark, the mountains’ glacial winds of this valley make the temperature seem hundreds of times colder. \n\nBoth hands wrap your winter cloak tightly around your body, but somehow you can still feel the ice-sharded winds as if on bare skin.\nYou squint your eyes down at your weapon and wonder if it has become frozen to your belt. \nNothing alive can possibly live in these temperatures, you reassure yourself, pushing back thoughts of the living dead you’ve heard emerge with the castle.\n\nSoon, you can make out the faint ruined form of the castle up ahead. The old crone’s rotting map was right! Your best guess tells you it’s another hour’s walk in the harsh cold. \nBefore you have time to think about the longer walk, you spot a gaping black opening in the snow. It must be a cave. The crone told you that underground tunnels could also lead into the castle.\n\nCould this be one? Or is it the lair of some beast \n\n" #this needs to be the formatted story text

            puts "What do you want to do?\n\n" #this needs to be the list of things you could do
            puts "To choose, type the number corresponding to your choice and press enter"
            puts "[1] Explore the cave"
            puts "[2] Continue on your cold trek to the castle"

           getNextCard(cardDestinations)
         #   @cardDestinations = gets.chomp.to_i #this is the input.#now moved to parent class
            if cardDestinations ==1 #this is each of the possible choices, and will have an else for each possible destination
                Card12.new.startCard12#this calls the destination card
            elsif cardDestinations ==2
                Card19.new.startCard19
                #need a copy paste catch statement for any other entry possibly a menu option
            else 
                puts "unrecognised input" 
                Card1.new.startCard1 
            end
        end
    end

    class Card2 < StoryCard
        def startCard2() #this needs to clear the screen
            clearScreen()
            autoSave(2)
            puts "Double-wrapping your hands to protect them from the cold, you dig under some broken statues. In a few minutes you’ve uncovered a beautiful antique mace, its metal head coated in an unusual blue lacquer.\n\n
            Digging some more, you realize something – the weapon still has a frozen hand attached to it! A second later, your boot brushes aside the remains of the man’s face! The blue skin is cracked and broken. Apparently, some warrior died wielding this mace\n\n"
            
            #add a skill check to take the mace (will).
            card2Test = WillCheck.new.willCheck
            card2ToPass = Player.will
                if card2Test > card2ToPass #fail
                    puts "ewwwWWWWW!\n\n"
                elsif card2Test <= card2ToPass #success
                    puts "Gritting your teeth, you take the mace. It might come in handy\n\n"
                    pushLoot("Antique Mace")  #need to push mace to inventory
                else
                    puts "This is an error. I have no idea how you called it"
                end

            puts "Which way now?"
            puts "[1] Through the servants door\n"
            puts "[2] Through the Guardhouse\n"

            getNextCard(cardDestinations)
           # @cardDestinations = gets.chomp.to_i

            if cardDestinations ==1
                Card14.new.startCard14
            elsif cardDestinations ==2
                Card11.new.startCard11
            else
                puts "you decide to head to the guardhouse"#I don't want to send the player back to the top because it would give them a second shot at the mace if they miss it
                Card11.new.startCard11 #so they go the way that takes them through more of the story
            end
        end
    end

    class Card3 <StoryCard
        def startCard3()
            clearScreen()
            autoSave(3)
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
            elsif cardDestinations == 3
                Card11.new.startCard11
            else
                Card3.new.startCard3
            end
        end
    end

    class Card4 <StoryCard
        def startCard4() #
            clearScreen()
            autoSave(4)
            puts "You see a woman, half-dressed, standing in the room. Her skin is icy pale. \nShe picks up the remnants of her clothes and stares at you, her ice blue eyes burning into the back of your head. \n\nBefore you can even wonder about the true nature of this delicate creature, she disappears in a flurry of fine ice. \nYou shake your head and enter the room"
            puts "..."
            puts "[1] Continue"

            getNextCard(cardDestinations)
           # @cardDestinations = gets.chomp.to_i

            if cardDestinations ==1
                Card45.new.startCard45
            else
                Card45.new.startCard45 #there is no escape
            end
        end
    end

    class Card5 <StoryCard
        def startCard5() 
            clearScreen()
            autoSave(5)
            puts "You manage to loop the grapple around the gargoyle’s wing. Confident in your skill, you begin the treacherous climb.\n\nCRACK!\n\n The gargoyle breaks away and you plummet to the snowy ground.\n\nTending your sore arm from the fall, you decide to circle around the castle and look for another way in."
            puts "..."
            puts "[1] Continue"
            #add Fall damage, and emphasis on the CRACK
            fallDamageMid5 = CombatRolls.new.rollDamage
            fallDamage5 = fallDamageMid5 -4
            Player.hitpoints -=fallDamage5
    #The fall does 1d-1 cr damage, with only soft armor protecting.
            getNextCard(cardDestinations)
            #@cardDestinations = gets.chomp.to_i
            if cardDestinations ==1
                Card3.new.startCard3
            else 
                Card3.new.startCard3 #still no escape
            end
        end
    end

    class Card6 <StoryCard
        def startCard6() 
            clearScreen()
            autoSave(6)
        puts "As you are about to leave, you spot a tarnished, silver ring on one of the skeletons.\nYou pull it off and examine it. Apparently, it was the captain of the guard’s signet ring.\nPocketing it, you head out the door for the servant’s entrance"
        puts "..."
        puts "[1] Continue..." #add signet ring to inventory
            pushLoot("Signet Ring")
        getNextCard(cardDestinations)
       # @cardDestinations = gets.chomp.to_i
            if cardDestinations ==1
                Card14.new.startCard14
            else 
                Card14.new.startCard14
            end
        end
    end

    class Card7 <StoryCard
        def startCard7() 
            clearScreen()
            autoSave(7)
        puts "You stride forward with confidence and crack open the half-broken door but quickly realize that you can’t see – it’s too dark to make out anything but dim silhouettes.\n\nYou fumble to get a torch lit as you hear a hissing cackle that chills your bones."
        puts "..."# this needs to be replaced with the pass/fail skill check that adds a modifier to the next destination
        darkness = false #this may need to move out of this class we could just replace this with a torch item in the inventory
            card7Test = DexChecks.new.dexterityCheck
            card7ToPass = Player.dexterity
                if card7Test > card7ToPass #fail
                    darkness = true
                    puts "You fumble with the torch before dropping it\n\n"
                else card7Test <= card7ToPass
                    darkness = false
                end
        puts "[1] Continue"

        getNextCard(cardDestinations)
        #@cardDestinations = gets.chomp.to_i
            if cardDestinations ==1
                Card38.new.startCard38
            else 
                Card38.new.startCard38
            end
        end

    end

 class Card8 <StoryCard
    def startCard8() 
         clearScreen()
         autoSave(8)
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
       elsif cardDestinations == 3
           Card17.new.startCard17
       else 
            Card8.new.startCard8
       end
    end
 end

 class Card9 <StoryCard
    def startCard9() 
         clearScreen()
         autoSave(9)
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
        elsif cardDestinations ==3
            Card49.new.startCard49
        else 
            Card9.new.startCard9
        end
    end
 end

 class Card10 <StoryCard
     def startCard10() 
        autoSave(10)
         clearScreen()#this card has a strength check, and also checks fatigue
     puts "You dash past the creature into the smaller tunnel beyond him. You quickly jog down the cavern leaving the disgusting crunching noise behind you.\n\nThe tunnel winds its way for about twenty minutes until you can make out a bright white light from up ahead. When you come to this exit, you notice a thick layer of snow covering the cave opening.\n\nYou pull out your weapon and start digging.\nYour heart is pounding.\nSuddenly, from behind you, you hear the roar of the ice troll.\n\nDig faster!"
     puts "continue... (quickly)" #add fatigue
     puts "[1] dig, Dig, DIG!!" # make a strength check
        Player.fatiguepoints -=1
     card10Continue = gets.chomp.to_i
   
        card10Test = StrengthChecks.new.strengthCheck()
        card10ToPass = Player.strength
            if card10Test > card10ToPass
                cardDestinations =2
            else card10Test <= card10ToPass
                cardDestinations =1
            end

            if cardDestinations == 1 #pass
                Card26.new.startCard26
            else cardDestinations == 2 #fail
                Card20.new.startCard20
            end
    end
 end

 class Card11 <StoryCard
     def startCard11() 
         clearScreen()
         autoSave(11)
     puts "You approach the guardhouse door and push on it.\nNo luck.\nApparently, the guardhouse door is either locked or frozen shut."
     puts "What will you do?"
     puts "[1] Use your dagger to pick the lock"
     puts "[2] Try forcing the door open"

     getNextCard(cardDestinations)
        if cardDestinations == 1
            Card18.new.startCard18
        elsif cardDestinations == 2
            Card40.new.startCard40
        else 
            Card11.new.startCard11
        end
    end
 end

class Card12 <StoryCard
    def startCard12()
        clearScreen()
        autoSave(12)
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
            elsif cardDestinations == 3
                Card54.new.startCard54
            else
                Card12.new.startCard12
            end
    end
end

class Card13 <StoryCard
    def startCard13() 
        clearScreen()
        autoSave(13)
    puts "You spot something unusual – a small trap door in the side of the room.\nSmiling, and remembering that guardhouses often keep valuable weapons locked away, you head towards the door. Kneeling down, you pry it open easily – the lock has long since rusted away.\n\nInside the cubby hole is a pitted iron shortsword. It probably wouldn’t last a single swing, so you toss it aside.\nBehind the blade, however, is a steel-plated, medium shield. Painted on its face are three white bears.\nThough the paint is a little worn, it apparently protected the shield from the elements.\n\nYou carefully take the shield out, brush off some ice, and strap it to your back"
    puts "..."
    puts "[1] Continue (with a new shield)" #add shield to inventory/equipment
    pushLoot("Bear Shield")
    getNextCard(cardDestinations)
        if cardDestinations ==1
            Card6.new.startCard6
        else 
            Card6.new.startCard6
        end
    end
end

class Card14 <StoryCard
    def startCard14() 
        clearScreen()
        autoSave(14)
    puts "You need to duck your head to get into the servant’s entrance – the doorframe collapsed years ago.\n\nAfter your eyes adjust to the dim entranceway, you see that some great creature entered the castle here.\nGiant footprints have cracked through the wood of the floor here, and age-old blood has been spattered against the walls.\n\nIt gives you a shiver to think of what kind of creature attacked the castle.\nDigging through some old supplies, you uncover a skeleton of a dead servant.\n\nYou’re not sure if it was a man or woman, as only tattered cloth lies around its bones."
    puts "What now?"
    puts "[1] Search the area around the corpse"
    puts "[2] Continue onwards"
    getNextCard(cardDestinations)
        if cardDestinations == 1
            Card16.new.startCard16
        elsif cardDestinations == 2
            Card33.new.startCard33
        else
            Card14.new.startCard14
        end
    end
end

class Card15 <StoryCard
    def startCard15() 
        clearScreen() 
        autoSave(15)
    puts "The cliff isn’t as steep as you imagined, and many of its hand and footholds aren’t covered with ice.\n\nMake no mistake – this still isn’t an easy climb, and you should be careful."
    puts "..."
    puts "[1] Climb down the mountain..." #Make a Climbing roll (or DX-5 if you do not have the skill). Remember that Climbing rolls are penalized at -1 per encumbrance level
    
    card15Continue = gets.chomp.to_i

    card15Test = DexChecks.new.climbingCheck
    card15ToPass = Player.dexterity
        if card15Test > card15ToPass
            cardDestinations = 2
        elsif card15Test <= card15ToPass
            cardDestinations = 1
        else card15Test <=card15ToPass && Player.hitpoints <= 0
            cardDestinations = 3
        end 

   # getNextCard(cardDestinations)
        if cardDestinations == 1 #success
            Card36.new.startCard36
        elsif cardDestinations == 2 #fail and take damage
            Card36.new.startCard36
        else cardDestinations == 3 #fail and die
            puts "you died"
            #main_menu.new.start #needs to go back to main menu or game over screen
        end
    end
end

class Card16 <StoryCard
    def startCard16() 
        clearScreen()
        autoSave(16)
    puts "As you rummage through the tattered remnants of the skeleton, your hand scrapes across something razor sharp!\nYou raise your bloody hand to your mouth and probe the wound with your tongue.\n\nKicking aside some torn cloth, you see a glass dagger half-embedded in the wood"
    #You take 1d-4 cut damage (minimum 1)
    Player.hitpoints -=1
    puts "Now what?"
    puts "[1] Try to pry the dagger out"
    puts "[2] Leave it alone and keep going"
    getNextCard(cardDestinations)
        if cardDestinations == 1
            Card24.new.startCard24
        else cardDestinations == 2
            Card33.new.startCard33
        end

    end
end

class Card17 <StoryCard
    def startCard17() 
        clearScreen()
        autoSave(17)
    puts "You are in a battle with an ice troll, a massive beast with a shark-toothed maw and claws the size of long knives.\n\nYou’ve only seen one in your life – and that was a carcass a hunter brought back to your village when you were a child.\nThis one seems twice the size of that one!"
    #fight with the troll ensues - I think we just skip the tactical combat as there is only one other monster in the game
    puts "..."
    puts "[1] Raise your weapons"
        card17Continue = gets.chomp.to_i

        manageCombat(Icetroll,Player)

        if Player.hitpoints >0
            cardDestinations =1
        else Player.hitpoints <=0
            cardDestinations = 2
        end
    #getNextCard(cardDestinations)#this won't be a thing
        if cardDestinations == 1 #the troll is killed or retreats. functionally identical. the troll makes a will roll to fight to the death - no idea if this needs to be implemented
            Card21.new.startCard21
        else cardDestinations == 2 # you died, game over
            puts "you died"
        end
    end
end

class Card18 <StoryCard
    def startCard18() 
        clearScreen()
        autoSave(18)
    puts "You kneel down in the snow and peer through the keyhole.\nJust as you suspected... the door is locked with an older type of lock. Several stone pegs keep the door in place.\nYour knife might be able to do the trick, but it’s formidable"
    puts "what do you do\n\n"
    puts "[1] Try to pick the lock" # make a Lockpicking roll at +2 (or DX-3 if you do not have the skill)
    puts "[2] Try to break the door down" #this should only be exposed after failing to pick the lock
    puts "[3] Try the servants door instead" 

    getNextCard(cardDestinations)
        if cardDestinations == 1 

            card18LockPickTest = DexChecks.new.lockpickingCheck 
            card18LockPickTestMidway = Player.dexterity
            card18LockPickTestToPass = card18LockPickTestMidway -2 #because this test has a modifier

            if card18LockPickTest <= card18LockPickTestToPass
                Card30.new.startCard30 #succeed lockpick
            else card18LockPickTest >card18LockPickTestToPass
                puts "the Lock refuses to budge" #go to 40
                puts "[1] Continue"
                card18lockpickfail = gets.chomp.to_i
                Card40.new.startCard40
            end
        elsif cardDestinations == 2 #breaking down the door
            Card40.new.startCard40
        else cardDestinations == 3
            Card14.new.startCard14
        end  
    end
end

class Card19 <StoryCard
    def startCard19() 
        clearScreen()
        autoSave(19)
        puts "You stumble another half-hour in the snow. The cave was probably the home to a pack of yetis, or ice trolls. It’s a good thing you avoided it.\n\nUnfortunately, the cold winds have begun to take their toll.\n\nYou stare up at the looming castle.\n\nIts stone has been covered with sheets of ice as thick as your body.\nWith any luck, you won’t have to climb up the walls to find an entrance"
        #Reduce your FP by 1 and make a Survival (Mountains) roll.If you fail, you take an additional 1d-3 damage from exhaustion and hypothermia. 

        card19test = IQCheck.new.survivalCheck
        #puts  card19test
        card19ToPass = Player.intelligence
        #puts card19ToPass
            if card19test > card19ToPass#fail
                puts "the cold starts to take its toll on you, and it hurts."
                Player.fatiguepoints -=1
                damageFromColdmid = CombatRolls.new.rollDamage
                damageFromCold = damageFromColdmid -3
                Player.hitpoints -= damageFromCold
                #also need to do D6 -3 damage here
            else card19test <= card19ToPass
                puts "the cold takes its toll on you"
                Player.fatiguepoints -=1
            end

        puts "Where to now?"
        puts "[1] Circle around the castle to look for an entrace"
        puts "[2] Climb the wall with your rope and pitons"

        getNextCard(cardDestinations)
            if cardDestinations == 1
                Card3.new.startCard3
            elsif cardDestinations == 2
                Card35.new.startCard35
            else 
                puts "the climb looks scary" #don't like this solution, but it is a solution
                Card3.new.startCard3
            end
    end
end

class Card20 <StoryCard
    def startCard20() 
        clearScreen()
        autoSave(20)
    puts "You can’t dig fast enough.\n\nThe ice troll bounds up the cavern roaring in anger at your intrusion.\n\nYou turn your weapon on to the foul beast\n\n"
    #add Ambushed modifier. It doesn't matter in this case as it only affects tactical combat

    puts "[1] Prepare to Fight!"

    getNextCard(cardDestinations)
        if cardDestinations == 1
            Card17.new.startCard17
        else 
            Card17.new.startCard17
        end
    end
end

class Card21 <StoryCard
    def startCard21() #Resolves the troll fight. add Ice troll teeth to inventory
        clearScreen()
        autoSave(21)
    puts "You spit a curse at the defeated troll. You quickly search the creature’s lair but find nothing of interest other than some bloody bones and troll teeth.\n\nYou spend some time bandaging your wounds.\n\nAnxious to leave this chamber before the ice troll finds the courage to come back, you push your way down a long twisting corridor.\n\nThe end of the tunnel appears about twenty minutes later, but it’s been completely frozen shut with ice and snow.\nYou draw your weapon out and start pounding.\n\nIn about ten minutes you manage to break through.\nYou push your body out the hole you’ve made and feel something hard and stone-like in front of you"
    #This activity costs you 2 Fatigue Points (FP) – if your FP ever reaches 0, you drop from exhaustion and die from the cold!
    puts "[1] Continue onwards ..." # Make a First Aid or Physician roll (or IQ-4 if you do not have  the skill). If you succeed, you restore 1d-3 HP. If you fail, you still  get 1 HP back.
        
        Player.hitpoints += 3 #should be d6-3 min 1 #given how brutal the GM is here, I am just harcoding it
    
        Player.fatiguepoints -=2
        pushLoot("Troll Teeth")
        getNextCard(cardDestinations)
            if cardDestinations == 1
                Card47.new.startCard47
            else 
                Card47.new.startCard47
            end
    end
end

class Card22 <StoryCard
    def startCard22()
        clearScreen()
        autoSave(22)
    puts "Your body warms as you jog down the icy path.\nThough the walls of this tunnel are frozen solid, it is much warmer in here than in the cold, biting winds.\nYou glance down at the floor as you run, and are startled to see several large footprints walking in the direction you’re going.\nYou draw out your weapon to be on the safe side, and continue your journey down the dim hall.\n\nAlmost an hour later, you find the tunnel going uphill.\nYou slow down you pace – no need to get tired before reaching the castle.\n\nSuddenly, bright sunlight hits your eyes. You’ve found an exit! \n\nYou crawl out the small tunnel and find yourself looking over the edge of a tall cliff!\n\nAlmost directly below you lies the Castle of Madness.\nOnce you manage to get down the cliff, you’ll be near the walls of the castle\n\n"
    puts "Which way now?"
    puts "[1] Climb down the cliff"
    puts "[2] Walk around the wind torn cliff"
    getNextCard(cardDestinations)
        if cardDestinations == 1
            Card15.new.startCard15
        else cardDestinations == 2
            Card52.new.startCard52
        end
    end
end

class Card23 <StoryCard
    def startCard23() 
        clearScreen()
        autoSave(23)
    puts "Some of the tapestries are still together; others are torn and destroyed.\n\nTwo, in particular, catch your eye.\nOne tapestry shows a striking, blue-eyed maiden in ornate armor, the other shows a runed axe lying on a gilded table, being presented to a white-haired queen.\n\n"
    
    puts "[1] Yoink!"
    puts "[2] Examine the tapestries more closely" # Make a Merchant roll (or IQ-5 if you do not have the skill) to examine the tapestries further. the axe tapestry is worth 10, the armoured maiden tapestry is worth 100
    getNextCard(cardDestinations)


        if cardDestinations == 1 #take both or fail check
            Card51.new.startCard51
        else cardDestinations == 2 

            card23ToPass = Player.intelligence
            card23Test = IQCheck.new.merchantCheck

            if card23Test >card23ToPass 
                Card51.new.startCard51
            else card23Test <= card23ToPass
                Card57.new.startCard57 #suceed merchant check
            end
            
        end
    end
end

class Card24 <StoryCard
    def startCard24()
        clearScreen()
        autoSave(24)
    puts "Wrapping some cloth around your hand for protection, you try to wedge the glass dagger out.\nWith any luck, this exotic dagger will be worth a lot of silvers.\nOr maybe you’ll decide to keep it as a backup weapon.\n\n"
    #Make an DX roll. If you fail, the dagger slices through your gloves and into your hand. Take 1d-3 cut damage. If you succeed, you carefully pry the glass-like dagger out without injury. This is a very fine dagger and is enchanted to be Shatterproof
    card24Test = DexChecks.new.dexterityCheck
    card24TestToPass = Player.dexterity
        if card24Test >card24TestToPass
            puts "OWWW"
            Player.hitpoints -=1 #d6-3
        else card24Test <= card24TestToPass
            puts "ooh shiny"
            pushLoot("Glass Dagger")
            #add dagger to loot
        end
    
    puts "[1] Continue onwards"

    getNextCard(cardDestinations)
        if cardDestinations == 1
            Card33.new.startCard33
        else 
            Card33.new.startCard33
        end
    end
end

class Card25 <StoryCard
    def startCard25() 
        clearScreen()
        autoSave(25)
    puts "Deciding to head towards the main part of the castle, you skip the bedrooms and head down a long, winding hallway.\nMuch to your surprise, the castle in this part looks sturdy and complete.\n\nPerhaps it looked like this years ago when it was a newly built stronghold.\n\n You come to a stairway going downwards.\n\nThe stairs are covered with a slick ice.\n\n"
    #make a dx roll if fail  Take 1d-2 cr damage. 
    card25Test = DexChecks.new.dexterityCheck
    card25TestToPass = Player.dexterity
        if card25Test > card25TestToPass #fail
            Player.hitpoints -=2 #1d6-2
            puts "You slip down the steps and land hard on the hard stone. You curse your clumsiness and stand up.\n\n"
        else card25Test <= card25TestToPass
            puts "You carefully make your way down the steps and into a large, main room of the castle.\n\n"
        end

    puts "[1] Keep going"
    getNextCard(cardDestinations)
        if cardDestinations ==1
            Card33.new.startCard33
        else 
            Card33.new.startCard33
        end
    end
end

class Card26 <StoryCard
    def startCard26() 
        clearScreen()
        autoSave(26)
    puts "You barely make out the form of the ice troll at the far end of the cavern tunnel, but you know he’s coming fast!\n\nYou slam your weapon again and again against the ice and snow.\nSuddenly, sunlight rushes out to blind you.\nYou leap through the hole you’ve created and scramble out.\n\nYour head hits against something hard!\n\nYou look up and see a crumbled statue of an armored warrior in front of you.\n\nYou look around... you found a way into the courtyard of the Castle of Madness!\nYou shake your head and look around. The creature’s roar seems to have died off, so you’re safe for now.\n\nDozens of statues – most broken – litter the courtyard. You see two doors beyond the statue graveyard.\nThe smaller one looks to have been a a servant’s entrance; the other door, more reinforced, seems to be a guardhouse door"
    puts "What will you do now?"
    puts "[1] Search the courtyard"
    puts "[2] Go through the servants door"
    puts "[3] Go through the Guardhouse door"

    getNextCard(cardDestinations)
        if cardDestinations == 1
            Card43.new.startCard43
        elsif cardDestinations == 2
            Card14.new.startCard14
        else cardDestinations == 3
            Card11.new.startCard11
        end
    end
end

class Card27 <StoryCard
    def startCard27() 
        clearScreen()
        autoSave(27)
    puts "You slowly pad into the icy maze, trying to remember the turns you take.\n\nEvery once in a while you hear a soft moan from ahead of you."
    
    puts "[1] Follow the sounds...?" #Make a Tracking roll at +3, or an IQ-2 if you do not have the skill

    #suceed go to 37, fail go to 9 or 22

    card27Test = IQCheck.new.trackingCheck
    card27TestMidway = Player.intelligence
    card27TestToPass = card27TestMidway -3
 
        if card27Test <= card27TestToPass
            Card37.new.startCard37
        else card27Test > card27TestToPass
            puts "You strain to listen, but are unable to determine where the sound is coming from"
            puts "Now what?"
            puts "[1] Take the trodden path instead"
            puts "[2] take the icy path instead"
            getNextCard(cardDestinations)
                if cardDestinations == 1 #trodden path if failed
                    Card9.new.startCard9
                elsif cardDestinations == 2 #icy path if failed
                    Card22.new.startCard22
                else 
                    Card9.new.startCard9 #go fight the troll
                end
        end
    end
end

class Card28 <StoryCard
    def startCard28() 
        clearScreen()
        autoSave(28)
    puts "Unfortunately, most of the bedroom entries have collapsed and now lie blocked with rubble and debris.\nYou go down the hall, pushing on doors until you find one that opens.\n\nPeering into the room, you quickly discover that this was once a child’s bedroom.\n\nOld wooden toys lie on the floor. Many are broken, others are still intact. You pick up a finely-carved wooden chariot toy.\nIt seems to be holding figurine of a white-haired queen.\n\nYou take the chariot toy and figurine and place it gently into your sack.\nYour niece might like this one.\n\nThe small bed in the room is still intact, but as you come closer, you notice an oily and rancid smell coming from the mattress."
    pushLoot("Chariot Toy")
    puts "What do you do?"
    puts "[1] Return to the main corridor and keep going down it"
    puts "[2] Draw your weapon and lift the mattress"

    getNextCard(cardDestinations)
        if cardDestinations == 1
            Card25.new.startCard25
        elsif cardDestinations == 2
            Card58.new.startCard58
        else 
            Card28.new.startCard28
        end 
    end
end

class Card29 <StoryCard
    def startCard29() 
        clearScreen()
        autoSave(29)
    puts "You carefully climb the steps, but suddenly some of the stone crumbles underfoot.\n\nYour chin hits against the marble railing hard as you slide down to the bottom of the steps."
    #You take 1d-2 cr damage from the fall.
    Player.hitpoints -=2 #1d6-2
    puts "What will you do now?"

    puts "[1] Try the stairs again..."
    puts "[2] Forget these cursed stairs. Go down the main Corridor"

    getNextCard(cardDestinations)
        if cardDestinations == 1
            Card50.new.startCard50
        elsif cardDestinations == 2
            Card25.new.startCard25
        else 
            puts "You wont let these stairs defeat you!!\n\n"
            Card50.new.startCard50 #this isn't vindictive at all
        end
    end
end

class Card30 <StoryCard
    def startCard30() 
        clearScreen()
        autoSave(30)
    puts "You push the door inwards and hear it slam against the wall sharply.\n Waiting for your eyes to adjust to the darkness, you look around the room.\nA dozen skeletons in tattered armor lie against the walls of the room.\n\nYou swallow hard, and then quickly examine the skeletons.\nYou see no injuries on them. Apparently, these men locked themselves in this room and died here.\nYou let out a small cry when you see a pale blue rat scurry across the floor.\nYou’ve never heard of ice rats before, but you chide yourself for having been startled so easily.\nSearching the room, you find that most of the weapons and armor have rusted away a long time ago."
        
    puts "[1] You search the room"#make a perception roll

    card30Test = IQCheck.new.perceptionCheck
    card30TestToPass = Player.intelligence
       # getNextCard(cardDestinations)
        if card30Test <= card30TestToPass #success
            Card13.new.startCard13
        else card30Test > card30TestToPass #fail
            Card6.new.startCard6
        end
    end
end

class Card31 <StoryCard
    def startCard31() 
        clearScreen()
        autoSave(31)
    puts "You silently pad up the trodden path. The cave comes to a sharp turn.\n\nYou peer around the bend and see a hulking, blood-covered ice troll chewing apart a half-dead seal.\n\nHe’s licking his knife-sized claws and seems to be enjoying the pitiful squeals the seal is making."
    
    puts "[1] You make a stealth check" #a DX roll
        card31Test = DexChecks.new.stealthCheck
        card31TestToPass = Player.dexterity
       # getNextCard(cardDestinations)
        if card31Test <= card31TestToPass #success
            Card8.new.startCard8
        else card31Test > card31TestToPass #fail
            Card41.new.startCard41
        end
    end
end

class Card32 <StoryCard
    def startCard32() 
        clearScreen()
        autoSave(32)
    puts "The man’s leg is broken, but perhaps you can keep him alive until you head back this way.\nThe cave is warm enough to keep him alive, and there’s enough water for him to live on.\n\n“I will not live more than a few hours. My goddess visited me just a few minutes ago,“ he continues.\n\n “Well, she’ll make good company until I come back,” you say as you bandage and splint his leg.\n\n “Listen, I won’t be at the Castle of Madness for more than a day. When I come back, I’ll bring you with me.\nI’d take you now, but unless you can offer me a king’s treasure, I can’t afford it.”\n\nThe man nods gratefully, “I appreciate any effort you might make.”\n\nYou finish bandaging him and leave him some food.\n\n“I’d make you a fire, but the creature you mentioned might come back. Wouldn’t want you to lose another leg.”\n\nThe man grasps your shoulder.\n\n“Let me warn you... the trodden path leads to the home of the creature. I went down the icier path at first, but found an impassable cliff.\nThe creature attacked me and dragged me to his lair before I escaped.”\n\nThe warrior closes his eyes to rest, and you decide it is better to leave him now."
    puts "You head back to the slushy path and go back to the main cavern." 
    puts "Which way will you go now?"
    puts "[1] The trodden Path (even though it goes to the lair of the creature)"
    puts "[2] The Icier Path"
    puts "[3] Leave the cave and trek to the castle through the snow"
        pushLoot("Jrak Kul")
    getNextCard(cardDestinations)
        if cardDestinations == 1
            Card9.new.startCard9
        elsif cardDestinations == 2
            Card22.new.startCard22
        elsif cardDestinations == 3
            Card19.new.startCard19
        else 
            Card32.new.startCard32
        end
    end
end

class Card33 <StoryCard
    def startCard33() 
        clearScreen()
        autoSave(33)
    puts "You continue onwards, and find yourself in a banquet hall of sorts.\nShattered plates and a broken banquet table lie in the middle of the room.\nSeveral tapestries hang from the walls, and there seems to be a large hole in the floor under a particularly tattered one."
    puts "What will you do?"

    puts "[1] Examine the hole"
    puts "[2] Examine the Tapestries"

    getNextCard(cardDestinations)
        if cardDestinations == 1
            Card55.new.startCard55
        elsif cardDestinations == 2
            Card23.new.startCard23
        else 
            Card33.new.startCard33
        end
    end
end

class Card34 <StoryCard
    def startCard34() 
        clearScreen()
        autoSave(34)
    puts "In the bravest voice you can muster, you shout your name and clan. You hear a soft whisper from the passage ahead.\n\n“Help me, please. My leg is broken.”\n\nYou call out to the injured man,\n\n“Keep talking so I can find you.”\n\nWisely, you tie a piece of long cord to a nearby stalagmite. You can follow the cord back to this tunnel branch in case you get lost."
    puts "[1] Follow the voice"

    getNextCard(cardDestinations)
        if cardDestinations == 1
            Card37.new.startCard37
        else 
            Card37.new.startCard37
        end
    end
end

class Card35 <StoryCard
    def startCard35() 
        clearScreen()
        autoSave(35)
    puts "You remove your rope and grapple and find a nice target – a broken gargoyle near an open window."

    puts "[1] This cannot possibly go wrong"#make a climb check
        card35Continue = gets.chomp.to_i

    card35Test = DexChecks.new.climbingCheck
    card35TestMidway = Player.dexterity
    card35TestToPass = card35TestMidway -3

   # getNextCard(cardDestinations)
        if card35Test <= card35TestToPass #SUCCEED
            Card42.new.startCard42
        else card35Test > card35TestToPass #fail
            Card5.new.startCard5
        end
    end
end

class Card36 <StoryCard
    def startCard36() 
        clearScreen()
        autoSave(36)
    puts "A little sore and tired, you stare up at the looming castle ruin.\n\nAs the wind rushes through the broken turrets, you hear noises that sound like the screams of lunatics – no wonder they call this place the Castle of Madness.\nThe castle’s stone walls have been covered with sheets of ice as thick as your body.\n\nWith any luck, you won’t have to climb up the walls to find an entrance"
    puts "What will you do"
    puts "[1] Circle around and find an entrance"
    puts "[2] Use your pitons and rope to climb the walls"

    getNextCard(cardDestinations)
        if cardDestinations == 1
            Card3.new.startCard3
        elsif cardDestinations == 2
            Card35.new.startCard35
        else 
            Card36.new.startCard36
        end
    end
end

class Card37 <StoryCard
    def startCard37() #this needs to got to 61 after the medical check
        clearScreen()
        autoSave(37)
    puts "You find an injured hunter leaning against a cavern wall. He looks at you, his face ghastly and frostbitten.\n\n“How long have you been here?”you ask.\n\nThe wounded man swallows hard, “I don’t know. Three days, perhaps? Got lost tracking the most magnificent elk you’ve ever seen. \nAn unnatural creature ambushed me and snapped my leg like a dry branch. I crawled away as fast as I could, but now I’m lost and decided I have no stomach for running anymore.”\n\nYou look down and see the man’s leg twisted at an impossible angle. You grimace.\nThis man will not make it out of these caves alive."
    puts "[1] You try to help him"# make a Physician Check
        card37Continue = gets.chomp.to_i

    card37Test = IQCheck.new.firstAidCheck
    card37TestToPass = Player.intelligence

   # getNextCard(cardDestinations)
        if card37Test <= card37TestToPass #pass
            Card32.new.startCard32
        else card37Test > card37TestToPass #fail
            Card61.new.startCard61
        end
    end
end

class Card38 <StoryCard
    def startCard38() 
        clearScreen()
        autoSave(38)
    puts "You draw your weapon, expecting danger. The stench from this dark room is choking you.\n\nYou stare across the litter-filled room and gasp when you see that the whole room is covered in a liquid that can only be blood.\n\nIn the middle of the room, you can barely make out a skinny, man-like creature wearing practically nothing.\n\nYou see that his eyes are bloodshot and his skin is a disgusting mottled-red.\nHe lets out a half-hiss, half-cackle and stumbles towards you."
    
    #this is where the darkness modifier (-3 to rolls) pays off, and is the only other combat encounter in the game. Not sure if needed

    puts "[1] Your time is up, foul creature" #go to combat
        card38Continue = gets.chomp.to_i #maybe delete this next line
    manageCombat(BloodMan,Player)
    
        if Player.hitpoints > 0
            cardDestinations =1
        else Player.hitpoints <=0
            cardDestinations =2
        end
    #getNextCard(cardDestinations)
            if cardDestinations == 1
                Card48.new.startCard48
            else cardDestinations == 2 # defeat, game over
                Card1.new.startCard1
            end
    end
end

class Card39 <StoryCard
    def startCard39() 
        clearScreen()
        autoSave(39)
    puts "The ice and cold soon begins to numb your fingers, so you decide to give up your search.\nThe snow is too deep now in the courtyard to find anything of value"
    puts "Where to now?"
    puts "[1] The servants door"
    puts "[2] The guardhouse door"

    getNextCard(cardDestinations)
        if cardDestinations == 1
            Card14.new.startCard14
        elsif cardDestinations == 2
            Card11.new.startCard11
        else
            Card39.new.startCard39
        end
    end
end

class Card40 <StoryCard
    def startCard40() #
        clearScreen()
        autoSave(40)
    puts "The old door is heavy, and may even be locked, but you push with all your might"
    
    puts "[1] PUSH!" # Make a Forced Entry roll or a ST-4 roll 
    puts "[2] On second thought, maybe I'll try the lock" #only if you havent failed this already although I don't see why you shouldnt get multiple bites at this apple
    puts "[3] lets just try the servants door"

        getNextCard(cardDestinations)
        if cardDestinations == 1
            card40Test = StrengthChecks.new.forcedEntryCheck 
            card40TestMidway = Player.strength
            card40TestToPass =  card40TestMidway -4
               
            if card40Test <= card40TestToPass
                Card30.new.startCard30
                    else card40Test > card40TestToPass
                        puts "The door refuses to budge"
                        puts "[1] try picking the lock"
                        puts "[2] Go try the servants door"
                        getNextCard(cardDestinations)
                            if cardDestinations ==1
                                Card18.new.startCard18
                            else cardDestinations ==2
                                Card14.new.startCard14
                            end  
                    end
            
            elsif cardDestinations == 2
                Card18.new.startCard18
            else cardDestinations == 3
                Card14.new.startCard14
        end
    end
end

class Card41 <StoryCard
    def startCard41() 
        clearScreen()
        autoSave(41)
    puts "As the ice troll is licking his claws clean, his beady black eyes falls on you.\nHe lets out a roar from his wierd, circular mouth, tosses the mortally wounded seal against the side of the cave, and charges you"
   
    puts "[1] Draw your weapon"

    getNextCard(cardDestinations)
        if cardDestinations == 1
            Card17.new.startCard17
        else 
            Card17.new.startCard17
        end   
    end
end

class Card42 <StoryCard
    def startCard42() 
        clearScreen()
        autoSave(42)
    puts "You loop your grapple around the neck of the broken gargoyle.\nTesting the rope a few times, you hoist yourself and scramble up the thick rope.\n\nIn a few seconds, you reach an icy window sill."
    puts "what now"

    puts "[1] peer into the room first"
    puts "[2] Quickly scramble in"
    getNextCard(cardDestinations)
        if cardDestinations == 1 
            Card4.new.startCard4
        elsif cardDestinations == 2
            Card45.new.startCard45
        else 
            Card42.new.startCard42
        end
    end
end

class Card43 <StoryCard
    def startCard43() 
        clearScreen()
        autoSave(43)
    puts "You dig around the bases of the various statues, looking for anything of value."

    puts "[1] I search the room" #make a search roll

    card43Test = IQCheck.new.perceptionCheck
    card43TestToPass = Player.intelligence

    #getNextCard(cardDestinations)
        if card43Test <= card43TestToPass #succeed
            Card2.new.startCard2
        else card43Test > card43TestToPass #fail
            Card39.new.startCard39
        end
    end
end

class Card44 <StoryCard
    def startCard44() 
        clearScreen()
        autoSave(44)
    puts "You try to sneak past the troll"

    puts "[1] Quiet, Quiet" # make a stealth check vs 12
    
    card44Test = DexChecks.new.stealthCheck
    card44TestToPass = Icetroll.perception #This is the trolls passive perception, so its 12. From my reading of the rules, I am not sure if the troll gets to roll, or if its just his passive perception value
    #In any case, it is now dynamic in case it becomes possible to modify the trolls perception in future suing magic for example
    #getNextCard(cardDestinations)
        if card44Test <= card44TestToPass
            Card10.new.startCard10
        else card44Test > card44TestToPass
            Card41.new.startCard41
        end
    end
end

class Card45 <StoryCard
    def startCard45() 
        clearScreen()
        autoSave(45)
    puts "You swing your body over the icy sill of the window and leap into the dim room.\nThe white light shines through the window and illuminates the remnants of this old bedroom. A broken bed lies in the corner of the room, its decorative blanket still well preserved in the cold.\n\nA dresser with a shattered mirror sits opposite the bed, and you can almost feel the ghosts of the nobility who once slept here.\nYou look through some of the dressers, and find nothing but old clothes.\n\nNo, wait.\n\nUnderneath a fine blue chemise is a tarnished silver tiara.\n\nSmiling, you place the jewelry and the blue chemise in your sack.\n\nYou walk to the door and peer out.\n\nDark stairs lead upwards into a turret, and to the right, a corridor heads down to more abandoned bedrooms"
    pushLoot("Silver Tiara")
    pushLoot("Blue Chemise")
    puts "Which way now?"

    puts "[1] Up the stairs"
    puts "[2] On to another bedroom"
    puts "[3] Skip the bedrooms, straight down the corridor"

    getNextCard(cardDestinations)
        if cardDestinations == 1
            Card50.new.startCard50
        elsif cardDestinations == 2
            Card28.new.startCard28
        elsif cardDestinations == 3
            Card25.new.startCard25
        else 
            Card45.new.startCard45
        end
    end
end

class Card46 <StoryCard
    def startCard46() 
        clearScreen()
        autoSave(46)
    puts "You carefully press your ear to the door, holding your breath to keep the stench from interrupting your concentration.\n\nSuddenly, you feel this horrible pain in your ear.\nYou tear your ear from the door only to discover that you’re bleeding from hundreds of pores on the side of your face.\n\nYou gasp and draw out your weapon."
    #take 1 damage if you are still alive, keep going
    Player.hitpoints -=1

    puts "What will you do"
    puts "[1] bugger this! (run from the castle)"
    puts "[2] Relight your torch and kick the door in, weapon in hand"
    getNextCard(cardDestinations)
        if cardDestinations == 1
            Card53.new.startCard53
        elsif cardDestinations == 2
            Card38.new.startCard38
        else
            Card38.new.startCard38
        end
    end
end

class Card47 <StoryCard
    def startCard47() 
        clearScreen()
        autoSave(47)
    puts "You look up and see a crumbled statue of an armored warrior in front of you.\n\nYou look around... you found a way into the courtyard of the Castle of Madness!\n\nBeyond the graveyard of dozens of broken statues are two doors.\nThe smaller one seems to be a servant’s entrance; the other seems to be a guardhouse door"
    puts "What will you do?"
    puts "[1] Search the courtyard"
    puts "[2] Go through the servants door"
    puts "[3] Go through the guardhouse door"

    getNextCard(cardDestinations)
        if cardDestinations == 1
            Card43.new.startCard43
        elsif cardDestinations == 2
            Card14.new.startCard14
        elsif cardDestinations == 3
            Card11.new.startCard11
        else 
            Card47.new.startCard47
        end
    end
end

class Card48 <StoryCard
    def startCard48() 
        clearScreen()
        autoSave(48)
    puts "With an unnatural gurgle, the gruesome thing falls to the ground, dead.\nLighting a new torch to better see the room, you discover that this was once a servant’s chamber. \n\nThere is a framed picture on the wall of what seems to be the servant tending to a a striking, white-haired queen.\nYou’re startled at the realization that the servant in the painting looks like the bloody creature you just fought and killed."
    
    puts "[1] You search the room" #make a will check

    card48Test = WillCheck.new.willCheck
    card48TestToPass = Player.will
    #getNextCard(cardDestinations)
        if card48Test <= card48TestToPass #success
            Card56.new.startCard56
        else card48Test > card48TestToPass #fail
            puts "you do not have the stomach to rummage through the room’s bloody contents.\nYou decide to come back to the castle some other day –- perhaps with friends –- and discover its secrets in the safety of numbers"
            puts "[1] Leave this place"
            throwaway = gets.chomp.to_i #needs a wait for read function, or somehting to stop here. can I call the same function again here? could just be a gets.chomp to
            Card60.new.startCard60
        end
    end
end

class Card49 <StoryCard
    def startCard49() 
        clearScreen()
        autoSave(49)
    puts "You race down the icy corridor, weapon clenched tightly in hand. Screaming a battle cry, you charge headlong into a gruesome sight.\n\nA blood-covered troll has his teeth half-sunk into a squealing seal.\n\n He looks at you in surprise, throws the half-dead seal into the cavern wall, and roars his own battle challenge"
    puts "[1] DIE FOUL CREATURE!!!!!!!"

    getNextCard(cardDestinations) #this loop doesn't need to be here anymore
        if cardDestinations == 1
            Card17.new.startCard17
        else
            Card17.new.startCard17
        end
    end
end

class Card50 <StoryCard
    def startCard50() 
        clearScreen()
        autoSave(50)
    puts "Holding on to a marble railing, you begin to climb up the long spiral stairs that surely leads up to one of the castle’s turrets.\n\nAs you make your way up, you notice that the steps are worn and icy from years of being exposed to the element"
    # make a DX roll (oh thats dexterity. that makes so much sense now)
    card50Test = DexChecks.new.dexterityCheck
    card50TestToPass = Player.dexterity
    #getNextCard(cardDestinations)
        if card50Test <= card50TestToPass #success
            Card59.new.startCard59
        else card50Test >card50TestToPass #fail
            Card29.new.startCard29
        end
    end
end

class Card51 <StoryCard
    def startCard51() 
        clearScreen()
        autoSave(51)
    puts "You try to stuff both tapestries into your bag, but they’re just too heavy"
    #check strength, if not 14 or higher, you can only take 1
    puts "Which will you take?"
    puts "[1] The Tapestry of the blue-eyed maiden in ornate armor"
    puts "[2] The Tapestry of the runed axe lying being presented to a white-haired queen"

    getNextCard(cardDestinations)
        if cardDestinations == 1 #but with the relevant one in your inventory
            pushLoot("Maiden Tapestry")
            Card55.new.startCard55 
        else cardDestinations == 2
            pushLoot("Axe Tapestry")
            Card55.new.startCard55
        end
    end
end

class Card52 <StoryCard
    def startCard52() #this needs to clear the screen
        clearScreen()
        autoSave(52)
    puts "The cliff is icier than expected.\nYou slowly grasp and claw your way around the cliff, the winds constantly threatening to pick you up and toss you over.\n\nAs you circle around the cliff, a powerful gust picks up and sends you hurling towards the edge!"
    #make a DX check
    puts "[1] Grab for the edge!!!"
    timewaster = gets.chomp.to_i
        card52Test = DexChecks.new.dexterityCheck
        card25TestToPass = Player.dexterity #just noticed this typo. it doesn't matter
    #getNextCard(cardDestinations)
        if card52Test <= card25TestToPass #succeed
            Card36.new.startCard36
        else card52Test > card25TestToPass #fail
            Player.hitpoints -=5
            puts "You hit the ground. Hard."
            puts "[1] Continue"
            card52continue = gets.chomp.to_i
            Card36.new.startCard36 #but take 2d6-2 fall damage. if you die you get eaten by grave ghouls
        end
    end
end

class Card53 <StoryCard
    def startCard53() #this needs to clear the screen
        clearScreen()
        autoSave(53)
    puts "You run from the castle, glad that you have managed to find the few valuables that you did.\n\nPerhaps one day you will gather friends and return to the castle."
    puts "[1] Continue..."

    getNextCard(cardDestinations)
        if cardDestinations == 1
            Card60.new.startCard60
        else
            Card60.new.startCard60
        end
    end
end

class Card54 <StoryCard
    def startCard54() #this needs to clear the screen
        clearScreen()
        autoSave(54)
    puts "As you walk down the rock path, the ground beneath your boots turns to slush.\n\nSeveral minutes later, you find yourself walking through ankle-deep water.\n\nYou fill up your waterskin from this source – it’s better than eating snow.\nYou light a torch, as most of the light from the cave entrance has faded away.\n\nAs you continue onwards, the ground becomes steadier and smoother.\nYou kneel to examine it, and find a thick, half-frozen red liquid on the ground.\n\nYou study it closer – blood!\n\n Before you have time to think about your grisly discovery, you hear a moan from up ahead.\n\nYou take a few steps forward, but see that the passage you’re in twists and turns in a dozen directions. An icy labyrinth lies ahead"
   
    puts "What will you do?"
    puts "[1] Shout your name and make your presence known"
    puts "[2] Sneak up and try to see what is making the noise"

    getNextCard(cardDestinations)
        if cardDestinations == 1
            Card34.new.startCard34
        elsif cardDestinations == 2
            Card27.new.startCard27
        else 
            Card54.new.startCard54
        end
    end
end

class Card55 <StoryCard
    def startCard55() 
        clearScreen()
        autoSave(55)
        puts "Careful of the crumbling floor, you peer down into the dark hole.\n\nA horrible reek hits you, and you involuntarily snap your hand over your nose.\nEven in this cold weather, something down the hole smells really bad.\n\nYou look down further into the pit and see that the ground is about ten feet below where you stand. You could jump down.\n\nBrushing yourself off, you look around the dimly lit chamber. You realize your torch is sputtering.\nWithin seconds, the darkness in the chamber closes around you.\nYou can barely make out a worn door, a few feet away, indecipherable writings slashed into its wood."
    # Make a DX roll. On a success, you jump down without injury. If you fail, you take 1d-4 cr damage from the fall.
        card55Test = DexChecks.new.dexterityCheck
        card55TestToPass = Player.dexterity
            if card55Test <= card55TestToPass
                puts "You jump down without injury\n\n"
            else card55Test > card55TestToPass
                puts "You don't quite stick the landing\n\n"
                Player.hitpoints -=1
            end
    puts "Now what?"
    puts "[1] Creep up to the door and listen"
    puts "[2] Go forward bravely and push the door aside"

        getNextCard(cardDestinations)
            if cardDestinations == 1
                    Card46.new.startCard46
            elsif cardDestinations == 2
                    Card7.new.startCard7
            else 
                Card46.new.startCard46 #go fight the bad guy
            end
    end
end

    class Card56 <StoryCard
        def startCard56() 
            clearScreen()
            autoSave(56)
        puts "Gritting your teeth you pull up the bloody, torn mattress that lies on the floor. A silver sparkle catches your eye.\nYou reach down and pick up a beautiful silver and glass scepter. Perhaps it belonged to the noble pictured in this room.\n\nConfident that you’ve found a great treasure, you throw your burning torch on the mattress and let the room ignite.\nYou’re determined to clean out the filth of the creature that lived here.\n\n Dashing out of the smoky room, you leave the Castle of Madness behind.\nSurely more treasure and adventure lies within its walls, but you feel better returning with trusted friends.\nPerhaps with a party of adventurers, the yetis and blood men will not pose as much of a threat"
        puts "[1] Time to leave this place"
            pushLoot("Glass Sceptre")
        getNextCard(cardDestinations)
            if cardDestinations == 1
                Card60.new.startCard60
            else 
                Card60.new.startCard60
            end
        end
    end

    class Card57 <StoryCard
        def startCard57() 
            clearScreen()
            autoSave(57)
        puts "You’re smart enough to know that it’s not the design on the tapestry that is worth gold, but the fabric itself.\nCarefully examining both tapestries, you see that the runed axe one is cheaper and shoddier than the finely woven fabric of the armored maiden tapestry is"
        puts "[1] Take the Tapestry of the Armoured maiden, and examine the hole in the floor" #add armoured maiden to inventory
            pushLoot("Maiden Tapestry")
        getNextCard(cardDestinations)
            if cardDestinations == 1
                Card55.new.startCard55
            else 
                Card55.new.startCard55
            end
        end
    end

    class Card58 <StoryCard
        def startCard58() 
            clearScreen()
            autoSave(58)
        puts "Grasping your knife tightly – the space around the bed is too small to wield your main weapon – you kick over the mattress.\nYou jump back in shock when you see a half-eaten, bloodless corpse staring up at you.\n\nTurning away in revulsion, you stagger back before you steady yourself for a second look.\nThe man has only been dead for a few weeks – he’s dressed in a wind-torn cloak and has well-worn boots on the remains of his feet.\nApparently, this man was exploring the castle like you.\nWhat ate him and stuffed his body in this bed, however, is beyond your imagination"
        
        puts "[1] leave the room and head down the corridor"

        getNextCard(cardDestinations)
            if cardDestinations == 1
                Card25.new.startCard25
            else 
                Card25.new.startCard25
            end
        end
    end

    class Card59 <StoryCard
        def startCard59() #this needs to add the crossbow
            clearScreen()
            autoSave(59)
        puts "Your foot slips up the stairs once, but your tight hold on the railing saves you from a nasty fall down the steps.\nYou have to drag yourself up the last few steps, since the ice is about as thick as your fist.\nPulling your way onto a cold landing, where the wind whips through open windows and chills you to the bone, you glance around this ancient lookout tower.\n\nIt seems all barren, except for a lone crossbowmounted on the wall.\nYou pull it down and strap it to your back. You’ve never used a crossbow before, but it may come in handy later.\n\nYou kick the dirty snow beneath the crossbow and find what you were looking for – a single, rusty bolt.\nYou’ll have one shot with this crossbow.\nHappy that you found anything at all in this crumbling tower, you carefully make your way down the stairs"
        pushLoot("Crossbow")
        puts "Now which way?"

        puts "[1] Explore the Bedrooms"
        puts "[2] Down the main corridor"

        getNextCard(cardDestinations)
            if cardDestinations == 1
                Card28.new.startCard28
            else cardDestinations == 2
                Card25.new.startCard25
            end
        end
    end

    class Card60 < StoryCard
        def startCard60()
            clearScreen()
            autoSave(60)
            puts "You arrive back in the town of Winterhaven a little injured, but safe.\nYou quickly head to the local merchant’s bazaar to sell the wares that you found.\nThe merchants are all very impressed - many of the goods you found were antiques and are quite valuable\n\n"
            #if rescuer == true
           
                if Player.loot.include? "Jrak Kull" #this is a sneaky way of doing it, but it works and the player will never see
                puts "You drag the wounded warrior back to Winterhaven.\nYou discover his name is Jrak Kul, a lieutenant in Winterhaven’s town watch, and a member of the secretive Martyrs of War clan.\n\nThe Martyrs reward you handsomely for his safe return – 5 silver talents – and invite you to join their ranks.\n\n"
                elsif Player.loot.include? "Amythest Ring"
                    puts "You take the amythest ring back to the captain of the guard in Winterhaven, where you discover the mans name was Jrak Kul. The lietenant thanks you for bringing it back and pays you a few silver coins for its return.\n\n"
                else 
                    puts "The local guard captain asks you if you saw his lieutenant, but you can only tell him where he was not"
                end

                #need to add your total loot score here
                countLoot()
            puts "Congratulations - You have bested the Castle of Madness, and have quite the tale to tell the folks back in the tavern\n\n"
            puts "Many thanks to JC Connors for writing this module, So I had something to use as a basis for the story.\nIt would not have been possible any other way.\n\n"
            
            puts "[1] Back to Main Menu"
            puts "[2] Quit the game"
            getNextCard(cardDestinations)
                if cardDestinations ==1 
                    puts "not implemented"
                    #main_menu.start
                else cardDestinations == 2
                    puts "not implemented"
                    #main_menu.quitGame
                end
            #Go back to main menu/call credits
        end
    end

    class Card61 <StoryCard
        def startCard61() #this was split off from card 37 to make it work with the logic
            clearScreen() #push amythest ring to inventory
            autoSave(61)
            pushLoot("Amythest Ring")
        puts "“I know,” he answers, grinning as if he heard your thoughts.\n\n“I will not live more than a few hours. My god visited me just a few minutes ago and told me himself!”\n\n“Let me warn you,” he continues.\n\n“The trodden path leads to the home of the creature.\nI went down the icier path at first, but found an impassable cliff. The creature attacked me again there and dragged me to his lair before I escaped The man shudders.\n\n“Here, take this ring and give it to my the guard captain in Winterhaven. He will contact my family and tell them of my useless death.\nAnd if you see that great elk, hunt it down, roast it over a fire... and think of me.”\n\nHe hands you an amethyst ring and you nod.\n\nThe warrior starts shaking and shuddering, and you decide it is better to leave him now.\nYou head back to the slushy path and go back to the main cavern"
        puts "Which way now?"
        puts "[1] Down the trodden path"
        puts "[2] The icier path"
        puts "[3] Leave the cave and trek to the castle through the snow"
            getNextCard(cardDestinations)
                if cardDestinations == 1
                    Card9.new.startCard9
                elsif cardDestinations == 2
                    Card22.new.startCard22
                elsif cardDestinations == 3
                    Card19.new.startCard19
                else 
                    Card61.new.startCard61
                end
            end
    end