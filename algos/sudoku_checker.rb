class SudokuChecker
  attr_reader :board

  REQUIRED_ELEMENTS = [1,2,3,4,5,6,7,8,9]

  def initialize(board)
    @board = board
  end

  def valid?
    downs_valid? && rows_valid? && grids_valid?
  end

  def downs_valid?
    lines = (0...9).map do |n|
      board.map do |line|
        line[n]
      end
    end


    sections_valid?(lines)
  end

  def grids_valid?
    sections_valid?(board)
  end

  def rows_valid?
    lines = board.map do |line|
      (0...9).map do |n|
        line[n]
      end
    end

    sections_valid?(lines)
  end

  def sections_valid?(sections)
    sections.any?{ |section| !section_valid?(sections) }
  end

  def section_valid?(section)
    return false unless (section - REQUIRED_ELEMENTS) == []
  end
end

board = [5, 3, 2, 9, 8, 6, 7, 4, 1], [4, 8, 7, 2, 1, 5, 3, 6, 9], [6, 9, 1, 4, 3, 7, 5, 8, 2], [3, 2, 5, 1, 7, 4, 8, 9, 6], [7, 6, 4, 3, 9, 8, 1, 2, 5], [8, 1, 9, 5, 6, 2, 4, 3, 7], [1, 5, 6, 8, 2, 3, 9, 7, 4], [9, 7, 8, 6, 4, 1, 2, 5, 3], [2, 4, 3, 7, 5, 9, 6, 1, 8]
puts SudokuChecker.new(board).valid? == true
puts SudokuChecker.new(board).grids_valid?
