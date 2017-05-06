require 'spec_helper'

RSpec.describe NumeriRomani do
  it 'has a version number' do
    expect(NumeriRomani::VERSION).not_to be nil
  end

  it 'should convert to roman and back' do
    (1..3999).each do |number|
      roman = NumeriRomani.to_roman(number)
      expect(NumeriRomani.to_decimal(roman)).to eq number
    end
  end

  describe '.to_roman' do
    it 'should raise error for invalid data' do
      expect { NumeriRomani.to_roman(0) }.to raise_error(ArgumentError)
      expect { NumeriRomani.to_roman(4000) }.to raise_error(ArgumentError)
      expect { NumeriRomani.to_roman(-1) }.to raise_error(ArgumentError)
    end

    it 'should convert correctly' do
      expect(NumeriRomani.to_roman(1)).to eq 'I'
      expect(NumeriRomani.to_roman(2)).to eq 'II'
      expect(NumeriRomani.to_roman(3)).to eq 'III'
      expect(NumeriRomani.to_roman(7)).to eq 'VII'
      expect(NumeriRomani.to_roman(13)).to eq 'XIII'
      expect(NumeriRomani.to_roman(17)).to eq 'XVII'
      expect(NumeriRomani.to_roman(19)).to eq 'XIX'
      expect(NumeriRomani.to_roman(25)).to eq 'XXV'
      expect(NumeriRomani.to_roman(86)).to eq 'LXXXVI'
      expect(NumeriRomani.to_roman(99)).to eq 'XCIX'
      expect(NumeriRomani.to_roman(444)).to eq 'CDXLIV'
      expect(NumeriRomani.to_roman(999)).to eq 'CMXCIX'
      expect(NumeriRomani.to_roman(1001)).to eq 'MI'
      expect(NumeriRomani.to_roman(2509)).to eq 'MMDIX'
      expect(NumeriRomani.to_roman(3999)).to eq 'MMMCMXCIX'
    end
  end

  describe '.to_decimal' do
    it 'should raise error for invalid data' do
      expect { NumeriRomani.to_decimal('qwerty') }.to raise_error(ArgumentError)
      expect { NumeriRomani.to_decimal('IDDM') }.to raise_error(ArgumentError)
    end

    it 'should convert correctly' do
      expect(NumeriRomani.to_decimal('IV')).to eq 4
      expect(NumeriRomani.to_decimal('VI')).to eq 6
      expect(NumeriRomani.to_decimal('VIII')).to eq 8
      expect(NumeriRomani.to_decimal('XII')).to eq 12
      expect(NumeriRomani.to_decimal('XVIII')).to eq 18
      expect(NumeriRomani.to_decimal('XXIX')).to eq 29
      expect(NumeriRomani.to_decimal('XLIV')).to eq 44
      expect(NumeriRomani.to_decimal('XCVIII')).to eq 98
      expect(NumeriRomani.to_decimal('CXI')).to eq 111
      expect(NumeriRomani.to_decimal('CDXLIX')).to eq 449
      expect(NumeriRomani.to_decimal('CMLI')).to eq 951
      expect(NumeriRomani.to_decimal('MMXVII')).to eq 2017
      expect(NumeriRomani.to_decimal('MMMCMXCVIII')).to eq 3998
    end
  end
end
