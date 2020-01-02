class ArrayGame
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def play
    i = board[0]
    complete = false
    visited = []

    while i > 0
      visited << i

      i = i + board[i]

      if board[i] == 0
        while visited.include? i
          i = i - 1
        end

        next
      end

      if i == board.length - 1
        complete = true
        break
      end
    end

    complete
  end
end

puts ArrayGame.new([3,4,1,1,-3,1,1]).play
puts ArrayGame.new([3,2,0,0,2,0,1]).play
