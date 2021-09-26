
# TODO - Stores player inventory (such as it is)
#this will be a hash

#TODO - Manage player hitpoints

#TODO deal damage to enemy
#strength 

class PlayerCharacter
    #needs health meter, you have HP equal to strength
    hitpoints = 15
    #fatigue points = health characteristic
    fatiguepoints = 14
    #needs an inventory, starting stuff and pickups
    #pickups: crossbow, shield, dagger, antique mace - first question is will these matter
    inventory = {}
    #start with sword - d6 +1 damage. mace upgrades it to D6+3
    #crossbow can be 1 shot, 2d6 damage
    #attacking = 3d6, low is good, DX check. 3= critical. no defense, max damage
    # medium shield is +2
    
    loot = {}
    #separate hash for loot?
    #signet ring, chariot toy, tapestries, troll teeth, Rescuer keyword,amythest ring, blue chemise, silver tiara, silver sceptre. the sneaky thing to do here is use the value as the key to the hash

    #needs skill points
    #pregen characters only, so we can hardcode in several cases 
    #need dexterity, will, climbing, strength, lockpicking, survival, merchant, first aid, forced entry?, search
    dexterity = 12
    strength = 13
    intelligence = 12
    will = 12
    perception = 13

    damageBlock = 9
    damageReduction = 4
end

    #you should also have a defense - 3d6, roll under defense score, shield if found adds to score, negates damage, 3 always suceeds, 17+ always fails

    #COMBAT
  
    #armour is a hard minus (lets make it a flat -4)

