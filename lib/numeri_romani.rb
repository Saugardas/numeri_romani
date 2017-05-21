require 'numeri_romani/digits'

module NumeriRomani
  class << self
    def to_roman(decimal_number)
      unless [Integer, Float, Rational].include?(decimal_number.class)
        raise ArgumentError.new('Number should be an Integer/Float/Rational')
      end
      unless decimal_number.between?(1/12r, 3_999_999 + 11/12r)
        raise ArgumentError.new('Number should be in interval [(1/12)..3_999_999(11/12)]')
      end
      integer = decimal_number.to_i
      fract = (decimal_number - integer).to_r
      fract = Rational((12.0 * fract.numerator / fract.denominator).round, 12)
      roman = DIGITS.map do |letter, value|
        count, integer = integer.divmod(value)
        [letter * count]
      end
      (roman << FRACTIONS.key(fract)).join
    end

    def to_decimal(roman_number)
      raise ArgumentError.new('Not valid roman number') unless roman_number.match?(REGEXP)
      result = roman_number.scan(/#{(DIGITS.keys + FRACTIONS.keys).join('|')}/).sum { |let| DIGITS[let] || FRACTIONS[let] }
      roman_number.match?(/\*/) ? result + roman_number.count('*') * 1/12r : result
    end
  end
end
