class Triangle
  # write code here
  attr_accessor :sides


  def initialize side1, side2, side3
    @sides = []
    @sides << side1
    @sides << side2
    @sides << side3
    @sides.sort!
  end

  def kind
    self.sides.length.times do |i|
      if self.sides[i] < 0
          raise TriangleError
      end
    end

    if self.sides == [0,0,0]
      raise TriangleError
    end

    if self.sides[0] + self.sides[1] <= self.sides[2]
      raise TriangleError
    end

    if sides.uniq.length == 1
      :equilateral
    elsif sides.uniq.length == 2
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
    def message
      "Invalid triangle"
    end
  end
end