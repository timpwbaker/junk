require 'set'
class ValidIp
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def all_possible
    digits = 3333
    valid = Set.new

    while digits >= 1111
      first = digits/1000
      second = (digits - (1000 * first))/100
      third = (digits - (1000 * first + 100 * second))/10
      fourth = digits%10

      i = 0

      parts = []

      parts << string[i...i+first]
      i = i + first
      parts << string[i...i+second]
      i = i + second
      parts << string[i...i+third]
      i = i + third
      parts << string[i...i+fourth]
      i = i + fourth

      puts valid.count
      valid.add(parts.join(".")) if valid?(parts)

      digits = digits - 1
    end

    valid
  end

  def valid?(parts)
    parts.each do |p|
      return false if p.nil? || p.empty? || p.to_i > 225
    end

    true
  end
end

puts ValidIp.new("19216811").all_possible
