class Person 
  @@MAX_HEALTH = 120
  def initialize(name)
    @name = name
    @health = [(rand * 100 + 70).round(0), @@MAX_HEALTH].min
  end
  def heal
    @health += 1 if @health < @@MAX_HEALTH
  end
end


class Viking < Person
  @@MAX_HEALTH = 120
  attr_reader :name, :age
  attr_accessor :dead, :health
  def initialize(name)
    super(name)
    @age = (rand * 30 + 20).round(0)
    @dead = false

  end

  def attack(recipient)
    if recipient.dead
      puts "#{recipient.name} is already dead!"
      return 0
    end
    damage = (rand * 10 + 10).round(0)
    recipient.take_damage(damage)
  end

  protected

  def take_damage(damage)
    @health -= damage
    puts "Ouch! #{@name} took #{damage} and has #{@health}health!"
    if health <= 0 
      die
    end
    heal
  end

  private

  def heal
    #vikings heal 5 times as fast as normal people
    5.times {super}
  end

  def die
    @dead = true
  end

end

oleg = Viking.new("Oleg")
sten = Viking.new("Sten")
10.times {
  oleg.attack(sten)

  sten.attack(oleg)

}
p oleg
p sten