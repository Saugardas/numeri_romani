require 'numeri_romani/version'
require 'numeri_romani/digits'

module NumeriRomani
  class << self
    def to_roman(decimal_number)
      raise ArgumentError.new('Number should be an Integer') unless decimal_number.is_a?(Integer)
      raise ArgumentError.new('Number should be in interval [1..3_999_999]') unless decimal_number.between?(1, 3_999_999)
      DIGITS.map do |letter, value|
        count, decimal_number = decimal_number.divmod(value)
        [letter * count]
      end.join
    end

    def to_decimal(roman_number)
      raise ArgumentError.new('Not valid roman number') unless roman_number.match?(REGEXP)
      roman_number.scan(/#{DIGITS.keys.join('|')}/).sum { |let| DIGITS[let] }
    end
  end
end
