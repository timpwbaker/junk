require 'pry'
class SpreadsheetEncoder
  attr_reader :columns

  def initialize(columns)
    @columns = columns
  end

  def decode
    columns.map do |column|
      sum = 0
      column.split("").reverse.each_with_index do |e, i|
        if i == 0
          sum = sum + letter_to_number(e)
        else
          sum = sum + (letter_to_number(e) * 26 ** i)
        end
      end
      sum
    end
  end

  def letter_to_number(letter)
    letter_score_mapping[letter]
  end

  def letter_score_mapping
    ('A'..'Z').to_a.zip((1..26).to_a).to_h
  end
end


puts SpreadsheetEncoder.new(["AZ"]).decode
puts SpreadsheetEncoder.new(["ZZZ"]).decode
puts SpreadsheetEncoder.new(["A"]).decode
puts SpreadsheetEncoder.new([706]).encode
