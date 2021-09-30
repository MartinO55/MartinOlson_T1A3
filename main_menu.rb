require_relative "game.rb"
require_relative "main.rb"

require "colorize"
require "colorized_string"
require "tty-prompt"
require "yaml"


#include game.rb
#include main.rb
#String.colors                       # return array of all possible colors names
#String.modes                        # return array of all possible modes
#String.color_samples                # displays color samples in all combinations
#TODO - Create a main Menu

#TODO - call New Game Function
#starts the game and goes to card 1

def startNewGame ()
    #could have you enter your name
    newGame = Beyond_the_vale.new #this calls the new game class, whose init method calls the first card
end

#TODO - call load game
#starts the game at a specific card, based on a save file
def loadGame()
    save_data = YAML.load_file "saveGame.yaml"
   # save_data = YAML.load(File.open(File.join(File.dirname("saveGame.yaml"),'saveGame.yaml')))
    cardnumbertopass = save_data["cardNumber"]
   # puts cardnumbertopass
   # puts save_data.inspect
   # puts cardnumber
   # savedCard ['playerSave']['cardnumber']
   # puts savedCard
   # puts save_data[:cardnumber]

    Load.new.loadGame(cardnumbertopass)
end

#TODO - Call quit from application
#exits the application

def quitGame ()

end

def beginVOM()
    prompt = TTY::Prompt.new
    puts  "Beyond the Veil of Madness\n\n".colorize(:blue)

    puts "A GURPS fantasy oneshot for one player by JC Connors\n\n".colorize(:blue)

    puts "Now a ruby gem by Martin Olson\n\n".colorize(:blue)
    puts "_______________________________________________________________________________\n\n"

    #puts "Please select what you would like to do\n\n"
    mainMenuNav = prompt.select("Please select what you would like to do\n\n") do |menu|
        menu.choice "Start new adventure", 1
        menu.choice "Load saved game", 2
        menu.choice "Quit game", 3
    end
    #puts "[1] Start new adventure"
    #puts "[2] Load saved game"
    #puts "[3] Quit Game"

    if mainMenuNav == 1
        startNewGame()
    elsif mainMenuNav == 2
        puts "this would load a game"
        loadGame()
    elsif mainMenuNav == 3
        puts "You quit the game" #this technically works
    else
        puts "unrecognised input"
    end
end

beginVOM()

#this needs to be called by a menu prompt/select
#startNewGame()