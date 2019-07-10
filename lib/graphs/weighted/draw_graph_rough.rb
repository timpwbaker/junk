
  def edges_x
    @_edges_x ||= [lowest_x, highest_x]
  end

  def edges_y
    @_edges_y ||= [lowest_y, highest_y]
  end

  def highest_y
    @_highest_y ||= [0, sorted_y.last.y].sort.last
  end

  def highest_x
    @_highest_x ||= [0, sorted_x.last.x].sort.last
  end

  def lowest_y
    @_lowest_y ||= [0, sorted_y.first.y].sort.first
  end

  def lowest_x
    @_lowest_x ||= [0, sorted_x.first.x].sort.first
  end

  def sorted_y
    @_sorted_y ||= nodes.sort_by{|n| n.y}
  end

  def sorted_x
    @_sorted_x ||= nodes.sort_by{|n| n.x}
  end


  def draw_graph
    left_to_zero = lowest_x
    zero_to_right = highest_x
    top_to_zero = highest_y
    bottom_to_zero = lowest_y
    arr = []
    (1..top_to_zero).each do |n|
      s = "*"
      (left_to_zero..-1).each do |x|
        s << " %-3s" % [' ']
      end
      s << " %-3s" % ['|']
      (1..zero_to_right).each do |x|
        s << " %-3s" % [' ']
      end
      s << "*"
      arr << s
    end
    part = " %-3s" % ['-']
    s = "*#{part * 13}*"
    arr << s

    (bottom_to_zero..-1).each do |n|
      s = "*"
      (left_to_zero..-1).each do |x|
        s << " %-3s" % [' ']
      end
      s << " %-3s" % ['|']
      (1..zero_to_right).each do |x|
        s << " %-3s" % [' ']
      end
      s << "*"
      arr << s
    end
    puts bottom_to_zero
    puts arr.join("\n")
  end
