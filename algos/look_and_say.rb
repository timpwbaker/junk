class LookAndSay
  attr_reader :n

  def initialize(n)
    @n = n
  end

  def iterate
    i = 0
    s = "1"
    output = []

    while i < n
      element = ""
      digit = s[0]
      count = 0

      s.chars.each do |c|
        if c == digit
          count += 1
        else
          element = "#{element}#{count}#{digit}"
          count = 1
          digit = c
        end
      end

      element = "#{element}#{count}#{digit}"
      s = element
      output << element
      i += 1
    end

    output.last
  end
end

puts LookAndSay.new(5).iterate
