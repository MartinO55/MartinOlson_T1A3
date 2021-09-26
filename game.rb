require "crapshoot"
require_relative "playercharacter.rb"

#TODO - call a pause menu
    #- For Pause menu, call a save, quit to menu and back to game function, as well as load?

#TODO - manage character interactions

# TODO - Manage Dice interactions

# TODO - Call enemies as appropriate

#TODO manage ascii art (if possible)

#So the skill checks live here now
class SkillChecks
    def climbingCheck()
        climbCheck = Crapshoot.roll '3d6'
       # puts climbCheck
        return climbCheck
    end
    #perception = IQ
    def perceptionCheck()
        spotCheck = Crapshoot.roll '3d6'
        return spotCheck
    end

    #Lockpicking - DX check
    def lockpickingCheck()
        lockpickCheck = Crapshoot.roll '3d6'
        return lockpickCheck
    end

    #merchant - IQ
    def merchantCheck()
        valueCheck = Crapshoot.roll '3d6'
        return valueCheck
    end

    #Survival - IQ
    def survivalCheck()
        surviveCheck = Crapshoot.roll '3d6'
        return surviveCheck
    end

    #First aid - IQ
    def firstAidCheck()
        medCheck = Crapshoot.roll '3d6'
        return medCheck
    end

    #Forced entry - strength
    def forcedEntryCheck()
        breakinCheck = Crapshoot.roll '3d6'
        return breakinCheck
    end

    #stealth = DX - quick contest, both roll DX, troll looking for beat 12, lowest wins if both suceed
    def stealthCheck()
        stealthyCheck = Crapshoot.roll '3d6'
        return stealthyCheck
    end
end