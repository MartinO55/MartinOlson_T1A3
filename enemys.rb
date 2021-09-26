# TODO - stores the enemies data

#TODO - deal damage to player

class EnemyCharacter
    attr_accessor :name, :hitpoints, :attackDamage


end


#TODO Troll
class IceTroll < EnemyCharacter
#15HP
@hitpoints = 15
#damage = 1d6 +2
end
#TODO Bloodman
class Bloodman < EnemyCharacter

#damage = d6 initially, then 1d6 -2 per round

#15HP
@hitpoints = 15

end