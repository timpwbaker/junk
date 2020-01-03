# @param {String} s
# @return {Boolean}
def is_valid(s)
    closing_required = []
    s.chars.each do |c|
        type = type(c)

        puts type
        puts closing_required

        case type
        when :open
          closing_required << closing(c)
        else
          next_closing_required = closing_required.pop
          if c != next_closing_required
              return false
          end
        end
    end

    return closing_required.empty?
end

def type(c)
    case c
        when "{", "[", "("
        :open
        when "}", "]", ")"
        :close
    else
        raise ArgumentError.new("invalid string")
    end
end


def closing(c)
    case c
        when "{"
          "}"
        when "["
          "]"
        when "("
          ")"
    end
end
