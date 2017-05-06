require 'numeri_romani/version'
require 'numeri_romani/digits'

module NumeriRomani
  class << self
    def to_roman(decimal_number)
      raise ArgumentError unless decimal_number.between?(1, 3_999)
      DIGITS.map do |letter, value|
        count, decimal_number = decimal_number.divmod(value)
        [letter * count]
      end.join
    end

    def to_decimal(roman_number)
      raise ArgumentError unless roman_number.match?(/^(M{0,3})(D?C{0,3}|C[DM])(L?X{0,3}|X[LC])(V?I{0,3}|I[VX])$/)
      roman_number.scan(/#{DIGITS.keys.join('|')}/).sum { |let| DIGITS[let] }
    end
  end
end
