class RomanToDecimal
  attr_accessor :roman

  def initialize(roman)
    @roman = roman
  end

  def convert
    total = 0

    mapping.each do |k, v|
      while roman.start_with?(k.to_s)
        total = total + v
        roman.sub!(k.to_s, "")
      end
    end

    total
  end

  def mapping
    {
      M: 1000,
      CM: 900,
      D: 500,
      CD: 400,
      C: 100,
      XC: 90,
      L: 50,
      XL: 40,
      X: 10,
      IX: 9,
      V: 5,
      IV: 4,
      I: 1
    }
  end
end

puts RomanToDecimal.new("LIX").convert == 59
