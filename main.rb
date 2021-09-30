
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

class Load
    def loadGame(cardNumber) #so this needs to call a function from a class that knows all the cards, where each function is an individual card
  #maybe it should call the players name as input with the autosave
        #this needs to concatanate cardnumber with Card to tell it where to go
      #cardToLoad = "Card" +cardNumber.to_s #this is a bit silly
       # puts "I called number " + cardNumber.to_s
       #long as buggery. hard to type. but it works, and it's thursday afternoon and I have documentation to write
       #so the lazy way to do this is to write loop to iterate 1 to 61 and type them for you


      h = {1=>Card1.new.startCard1,2=>Card2.new.startCard2,3=>Card3.new.startCard3, 4=>Card4.new.startCard4, 5=>Card5.new.startCard5,6=>Card6.new.startCard6,7=>Card7.new.startCard7,8=>Card8.new.startCard8,9=>Card9.new.startCard9,10=>Card10.new.startCard10,11=>Card11.new.startCard11,12=>Card12.new.startCard12,13=>Card13.new.startCard13,14=>Card14.new.startCard14,15=>Card15.new.startCard15,16=>Card16.new.startCard16,17=>Card17.new.startCard17,18=>Card18.new.startCard18,19=>Card19.new.startCard19,20=>Card20.new.startCard20,21=>Card21.new.startCard21,22=>Card22.new.startCard22,23=>Card23.new.startCard23,24=>Card24.new.startCard24,25=>Card25.new.startCard25,26=>Card26.new.startCard26,27=>Card27.new.startCard27,28=>Card28.new.startCard28,29=>Card29.new.startCard29,30=>Card30.new.startCard30,31=>Card31.new.startCard31,32=>Card32.new.startCard32,33=>Card33.new.startCard33,34=>Card34.new.startCard34,35=>Card35.new.startCard35,36=>Card36.new.startCard36,37=>Card37.new.startCard37,38=>Card38.new.startCard38,39=>Card39.new.startCard39,40=>Card40.new.startCard40,41=>Card41.new.startCard41,42=>Card42.new.startCard42,43=>Card43.new.startCard43,44=>Card44.new.startCard44,45=>Card45.new.startCard45,46=>Card46.new.startCard46,47=>Card47.new.startCard47,48=>Card48.new.startCard48,49=>Card49.new.startCard49,50=>Card50.new.startCard50,51=>Card51.new.startCard51,52=>Card52.new.startCard52,53=>Card53.new.startCard53,54=>Card54.new.startCard54,55=>Card55.new.startCard55,56=>Card56.new.startCard56,57=>Card57.new.startCard57,58=>Card58.new.startCard58,59=>Card59.new.startCard59,60=>Card60.new.startCard60,61=>Card61.new.startCard61}
    
      puts (h[cardNumber]) #this works. huh
      # puts "load #{cardNumber}?"
    #method(cardNumber)
   # method(loadcard)
    

    end    
end

def callCombat()

end

#TODO Game over function
class GAME_OVER
  def initialize()
    
  end

end
#call the cards - moved to the cards themselves
