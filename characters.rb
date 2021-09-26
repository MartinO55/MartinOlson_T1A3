class Character
    attr_accessor :name, :hitpoints,:damageReduction, :damageBlock, :perception, :fatiguepoints, :dexterity,:strength,:intelligence,:will
end

class PlayerCharacter <Character
    #needs health meter, you have HP equal to strength
    def initialize(name,hitpoints,damageReduction,damageBlock,fatiguepoints,dexterity,strength,intelligence,will,perception)
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
    #crossbow can be 1 shot, 2d6 damage
    #attacking = 3d6, low is good, DX check. 3= critical. no defense, max damage
    # medium shield is +2
    inventory = {}
    loot = {}
    #separate hash for loot?
    #signet ring, chariot toy, tapestries, troll teeth, Rescuer keyword,amythest ring, blue chemise, silver tiara, silver sceptre. the sneaky thing to do here is use the value as the key to the hash
    end
end

Player = PlayerCharacter.new("steve",15,4,9,14,12,13,12,12,13) #this hardcodes the player sheet, but can be accessed from anywhere

#TODO Troll
class IceTroll < Character
    def initialize
    @type = "iceTroll"
    @hitpoints = 15
    @damageReduction = 2
    @damageBlock = 9 #Dodge

    @dexterity = 12
    @strength = 15
    @intelligence = 7
    @will =11
    @fatiguepoints = 12
    end
#damage = 1d6 +2
end

#TODO Bloodman
class Bloodman < Character
    def initialize
@type = "bloodman"
@hitpoints = 15
@damageReduction =1
@damageBlock = 10

@dexterity = 12
@strength = 13
@intelligence = 9
@will = 11
@fatiguepoints = 12
#damage = d6 initially, then 1d6 -2 per round
    end
end
# player = PlayerCharacter.new(type = "player",
#     hitpoints = 15,
#     damageReduction = 4,
#     damageBlock = 9,
#     fatiguepoints = 14,

#     dexterity = 12,
#     strength = 13,
#     intelligence = 12,
#     will = 12,
#     perception = 13)