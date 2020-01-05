class Rotate2D
  attr_accessor :board

  def initialize
    @board = board
  end

  def rotate
  end
end

board = [
  [1,2,3,4],
  [5,6,7,8],
  [9,10,11,12],
  [13,14,15,16]
]

puts Rotate2D.new(board).rotate.to_s
