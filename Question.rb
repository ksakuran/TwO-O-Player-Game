class Question

  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def check_answer?(answer)
    answer == (x + y)
  end

end

