require 'pry'
class Solver
  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def solve
    run_loop
    grid.print
  end

  def run_loop
    i = 0
    while i < grid.cells.size
      cell = grid.cells[i]

      new_value = find_cell_value(cell)
      while !grid.valid?
        new_value = find_cell_value(cell)
        break if !new_value
      end

      if new_value && grid.valid?
        i += 1
        while grid.cells[i] && grid.cells[i].fixed == true
          i += 1
        end
      else
        i -= 1
        while grid.cells[i] && grid.cells[i].fixed == true
          i -= 1
        end
      end
    end
  end

  def find_cell_value(cell)
    return unless cell

    if cell.value && cell.value == 9
      cell.value = nil
      return
    end

    cell.value = cell.value.to_i + 1
  end
end

class Grid
  attr_reader :max_x, :max_y, :cells, :input

  def initialize(max_x, max_y)
    @max_x = max_x
    @max_y = max_y
    @input = {
      "0_5": 6,
      "0_8": 1,
      "1_1": 8,
      "1_2": 7,
      "1_5": 5,
      "2_7": 8,
      "2_8": 2,
      "3_0": 3,
      "3_3": 1,
      "3_5": 4,
      "3_8": 6,
      "4_2": 4,
      "4_3": 3,
      "4_5": 8,
      "5_2": 9,
      "5_3": 5,
      "5_6": 4,
      "5_7": 3,
      "6_2": 6,
      "7_0": 9,
      "7_5": 1,
      "7_6": 2,
      "7_7": 5,
      "8_0": 2,
      "8_2": 3,
      "8_3": 7,
      "8_5": 9
    }

    @cells = build_cells
    @subsections = all_subsections
  end

  def print
    lines = []
    line = []

    cells.each_with_index do |c, i|

      if i%9 == 0 && i != 0
        lines << line
        line = []
      end

      line << c.value
    end

    lines << line
    puts lines.to_s
  end

  def full?
    !cells.any?{|c| c.value.nil? }
  end

  def build_cells
    cells = []

    (0..max_x).each do |x|
      (0..max_y).each do |y|
        cell = Cell.new(x, y)
        if input["#{x}_#{y}".to_sym]
          cell.value = input["#{x}_#{y}".to_sym]
          cell.fixed = true
        end
        cells << cell
      end
    end

    cells
  end

  def valid?
    all_subsections.each do |subsection|
      subsection.each do |ss|
        if invalid?(ss)
          puts "#{ss} invalid"
          return false
        end
      end
    end

    true
  end

  def invalid?(subsection)
    found = Hash.new {|h, k| h[k] = 0}
    subsection[1].any?{|cell| cell.value && found[cell.value] += 1; found[cell.value] > 1 }
  end

  def all_subsections
    @_all_subsections ||= [subsection_lookup, v_line_lookup, h_line_lookup]
  end

  def subsection_lookup
    @subsection_lookup ||=
      lookup = Hash.new {|h, k| h[k] = []}
      cells.each do |c|
        lookup["#{c.x/3}:#{c.y/3}"] << c
      end

      lookup
  end

  def v_line_lookup
    @v_line_lookup ||=
      lookup = Hash.new {|h, k| h[k] = []}
      cells.each do |c|
        lookup["#{c.x}"] << c
      end

    lookup
  end

  def h_line_lookup
    @h_line_lookup ||=
      lookup =  Hash.new {|h, k| h[k] = []}
      cells.each do |c|
        lookup[c.y] << c
      end

      lookup
  end
end

class Cell
  attr_accessor :value, :fixed
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
    @fixed = false
  end
end

puts Solver.new(Grid.new(8, 8)).solve
