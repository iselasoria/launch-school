# You're creating a game called Street Fighter.

# Street Fighter is a game where two characters fight.

# X Each street fighter has a special move, but they all punch, kick and block.

# X They all start with 100 health.

# Raiden is a god, and Kitana, Liu and Jax are humans.

# X Raiden has a very large hat.
# X Kitana has fans.
# X Liu Kane has no shirt.
# X Jax has metal arms.

# xRaiden shoots lightning out of his hands which inflicts 15 damage.
# xKitana throws her fans which inflicts 25 damage.
# xLiu Kane turns into a dragon which inflicts 72 damage.
# xJax pounds the ground which inflicts 63 damage.

# Raiden and Jax can set stuff on fire.

# Liu and Kitana can fly through the air.

=begin
NOUNS:
proper nouns:
- game
- characters
- god
- human


common nouns:
- health
- hat
- fan
- shirt (none)
- metal arms

VERBS:
attack:
  - shoot 15
  - throw 25
  - transform 72
  - pound 63

- light fire
- fly
=end
module Flyable
  def fly
    "I can fly!"
  end
end

def Fireable
  "I can set things on fire!"
end

class God
  attr_reader :name, :characteristic

  def initialize(name, characteristic)
    @name = name
    @characteristic = characteristic
    @health = 100
  end

  def punch
    puts "PUNCH!"
  end

  def block
    puts "BLOCK!"
  end

  def kick
    puts "KICK!"
  end

  def special_move
  end
end

class Human < God

end

raiden = Human.new('Raiden', 'large hat')
kitana = Human.new('Kitana', 'fans')
liu = Human.new('Liu', 'no shirt')
jax = Human.new('Jax', 'metal arms')
p jax.characteristic
p jax.name