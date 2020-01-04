require 'pry'
class Spiral2D
  attr_accessor :to_spiral, :x_thing, :y_thing, :n_thing, :output

  def initialize(to_spiral)
    @to_spiral = to_spiral
  end

  def spiral
    output = []

    coord = [0,0]

    while to_spiral[coord[0], coord[1]] != 0
      pattern.each_with_index do |direction, i|
        while (to_spiral[coord[0]] && to_spiral[coord[0]][coord[1]] &&
            to_spiral[coord[0]][coord[1]] != 0)

          output << to_spiral[coord[0]][coord[1]]

          to_spiral[coord[0]][coord[1]] = 0

          coord[0] = coord[0] + direction[0]
          coord[1] = coord[1] + direction[1]
        end

        coord[0] = coord[0] - direction[0]
        coord[1] = coord[1] - direction[1]

        if !pattern[i + 1]
          i = 0
          coord[0] = coord[0] + pattern[i][0]
          coord[1] = coord[1] + pattern[i][1]
        else
          coord[0] = coord[0] + pattern[i + 1][0]
          coord[1] = coord[1] + pattern[i + 1][1]
        end
      end

      break if board_complete?
    end

    output
  end

  def board_complete?
    rows = to_spiral.count
    if rows%2 == 0
      central_rows = [rows/2, rows/2 + 1]
    else
      central_rows = [rows/2 + 1]
    end

    central_rows.any? do |row|
      return false if to_spiral[row].any?{|n| n != 0 }
    end

    true
  end

  def pattern
    [[0,1], [1,0], [0,-1], [-1,0]]
  end
end

to_spiral = [
  [1,2,3,4],
  [5,6,7,8],
  [9,10,11,12],
  [13,14,15,16]
]

puts Spiral2D.new(to_spiral).spiral.to_s
