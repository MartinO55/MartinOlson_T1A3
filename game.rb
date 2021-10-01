require "crapshoot"
#require_relative "characters.rb"

#TODO - call a pause menu
    #- For Pause menu, call a save, quit to menu and back to game function, as well as load?

#TODO manage ascii art (if possible)

#So the skill checks live here now. should these be general or specific 
class SkillChecks
    def roll3d6()
        roll = Crapshoot.roll '3d6'
        return roll
    end
end
    #This is a massive amount of repitition, but is future proofing in case I want to come back and add modifiers, since all these checks should have minuses in a character who hasn't been given all the skills
    class DexChecks < SkillChecks

        def dexterityCheck()
            dexCheck = roll3d6()
            return dexCheck
        end
     
        def climbingCheck()
            climbCheck = roll3d6()
           # puts climbCheck
            return climbCheck
        end

        def lockpickingCheck()
            lockpickCheck = roll3d6()
            return lockpickCheck
        end

        def stealthCheck()
            stealthyCheck = roll3d6()
            return stealthyCheck
        end

    end

    class IQCheck <SkillChecks
        def perceptionCheck()
            spotCheck = roll3d6()
            return spotCheck
        end
        
        def merchantCheck()
            valueCheck = roll3d6()
            return valueCheck
        end

        def survivalCheck()
            surviveCheck = roll3d6()
            return surviveCheck
        end

        def firstAidCheck() #this is called twice
            medCheck = roll3d6()
            return medCheck
        end
        
        def trackingCheck()
            trackCheck = roll3d6()
            return trackCheck
        end
    end

    class StrengthChecks <SkillChecks
        def forcedEntryCheck()
            breakinCheck = roll3d6()
            return breakinCheck
        end

        def strengthCheck()
            strongCheck = roll3d6()
            return strongCheck
        end

    end

    class WillCheck<SkillChecks
        def willCheck()
            mindCheck= roll3d6()
            return mindCheck
        end
    end

   #different rolls for combat 
class CombatRolls
    def rollToHit()#roll under dex
        attackRoll = Crapshoot.roll '3d6'
        return attackRoll
    end
    def rollToBlock()#roll under block
        blockRoll = Crapshoot.roll '3d6'
        return blockRoll
    end
    def rollDamage()
        damageRoll = Crapshoot.roll '1d6'
        return damageRoll
    end
end
    
#Check loot function for the end?