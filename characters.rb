require_relative "game.rb"

class Character
    attr_accessor :name, :hitpoints,:damageReduction, :damageBlock, :perception, :fatiguepoints, :dexterity,:strength,:intelligence,:will
end

class PlayerCharacter <Character
    #needs health meter, you have HP equal to strength
    def initialize(name,hitpoints,damageReduction,damageBlock,fatiguepoints,dexterity,strength,intelligence,will,perception,inventory,loot)
    @name = name
    @hitpoints = hitpoints
    @damageReduction = damageReduction
    @damageBlock = damageBlock
    @fatiguepoints = fatiguepoints

    @dexterity = dexterity
    @strength = strength
    @intelligence = intelligence
    @will = will
    @perception = perception
    #needs an inventory, starting stuff and pickups
    #pickups: crossbow, shield, dagger, antique mace - first question is will these matter
    
    #start with sword - d6 +1 damage. mace upgrades it to D6+3
    #crossbow can be 1 shot, 2d6 damage probably just be loot
    #attacking = 3d6, low is good, DX check. 3= critical. no defense, max damage
    # medium shield is +2
    @inventory = inventory
    @loot = loot
    #separate hash for loot?
    #signet ring, chariot toy, tapestries, troll teeth, Rescuer keyword,amythest ring, blue chemise, silver tiara, silver sceptre. the sneaky thing to do here is use the value as the key to the hash
    end

    def attack()
        pAttackDamage = CombatRolls.new.rollDamage
        return pAttackDamage + 1 #hardcoded, should check inventory
    end

end

Player = PlayerCharacter.new("steve",15,4,9,14,12,13,12,12,13,{},{}) #this hardcodes the player sheet, but can be accessed from anywhere


#TODO Troll
class IceTroll < Character
    def initialize (type, hitpoints,damageReduction,damageBlock,dexterity,strength,intelligence,will,fatiguepoints)
    @type = type
    @hitpoints = hitpoints
    @damageReduction = damageReduction
    @damageBlock = damageBlock #Dodge
        #most of the below don't come up at all, but again, future proofing
    @dexterity = dexterity
    @strength = strength
    @intelligence = intelligence
    @will =will
    @fatiguepoints = fatiguepoints
    end

    def attack()
        tAttackDamage = CombatRolls.new.rollDamage
        return tAttackDamage +2
    end
end
Icetroll = IceTroll.new("troll",15,2,9,12,15,7,11,12)

#TODO Bloodman
class Bloodman < Character
    def initialize(type, hitpoints,damageReduction,damageBlock,dexterity,strength,intelligence,will,fatiguepoints)
        @type = type
        @hitpoints = hitpoints
        @damageReduction =damageReduction
        @damageBlock = damageBlock

        @dexterity = dexterity
        @strength = strength
        @intelligence = intelligence
        @will = will
        @fatiguepoints = fatiguepoints
    end

    def attack()
        bmAttackDamage = CombatRolls.new.rollDamage
        return bmAttackDamage +1
    end
end
BloodMan = Bloodman.new("bloodman",15,1,10,12,13,9,11,12)