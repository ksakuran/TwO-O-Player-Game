class Player

  attr_accessor :lives
  attr_reader :name

  def initialize(name)
    @lives = 3
    @name = name
  end

  def check_score 
    "#{lives}/3"
  end

  def lose_life
    self.lives -= 1
  end

  def lost?
    lives == 0
  end


end
    