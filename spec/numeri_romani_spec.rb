require 'spec_helper'

RSpec.describe NumeriRomani do
  it 'has a version number' do
    expect(NumeriRomani::VERSION).not_to be nil
  end

  it 'should convert to roman and back' do
    (1..3_999).each do |number|
      roman = NumeriRomani.to_roman(number)
      expect(NumeriRomani.to_decimal(roman)).to eq number
    end
    4_000.step(3_999_999, 100).each do |number|
      roman = NumeriRomani.to_roman(number)
      expect(NumeriRomani.to_decimal(roman)).to eq number
    end
  end

  describe '.to_roman' do
    it 'should raise error for invalid data' do
      expect { NumeriRomani.to_roman(0) }.to raise_error(ArgumentError)
      expect { NumeriRomani.to_roman('string') }.to raise_error(ArgumentError)
      expect { NumeriRomani.to_roman(4_000_000) }.to raise_error(ArgumentError)
      expect { NumeriRomani.to_roman(-1) }.to raise_error(ArgumentError)
    end

    it 'should convert correctly in [1..3_999]' do
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
      expect(NumeriRomani.to_roman(1_001)).to eq 'MI'
      expect(NumeriRomani.to_roman(2_509)).to eq 'MMDIX'
      expect(NumeriRomani.to_roman(3_999)).to eq 'MMMCMXCIX'
    end

    it 'should convert correctly numbers in [4_000..3_999_999]' do
      expect(NumeriRomani.to_roman(4_000)).to eq 'I̅V̅'
      expect(NumeriRomani.to_roman(99_001)).to eq 'X̅C̅I̅X̅I'
      expect(NumeriRomani.to_roman(173_012)).to eq 'C̅L̅X̅X̅MMMXII'
      expect(NumeriRomani.to_roman(2_345_678)).to eq 'M̅M̅C̅C̅C̅X̅L̅V̅DCLXXVIII'
      expect(NumeriRomani.to_roman(2_151_119)).to eq 'M̅M̅C̅L̅MCXIX'
    end

    it 'should convert fractions' do
      expect(NumeriRomani.to_roman(1.0)).to eq 'I'
      expect(NumeriRomani.to_roman(1.5)).to eq 'IS'
      expect(NumeriRomani.to_roman(3/2r)).to eq 'IS'
      expect(NumeriRomani.to_roman(1 + 1/12r)).to eq 'I⋅'
      expect(NumeriRomani.to_roman(1 + 2/12r)).to eq 'I∶'
      expect(NumeriRomani.to_roman(1 + 3/12r)).to eq 'I∴'
      expect(NumeriRomani.to_roman(1 + 4/12r)).to eq 'I∷'
      expect(NumeriRomani.to_roman(1 + 5/12r)).to eq 'I⁙'
      expect(NumeriRomani.to_roman(1 + 6/12r)).to eq 'IS'
      expect(NumeriRomani.to_roman(1 + 7/12r)).to eq 'IS⋅'
      expect(NumeriRomani.to_roman(1 + 8/12r)).to eq 'IS∶'
      expect(NumeriRomani.to_roman(1 + 9/12r)).to eq 'IS∴'
      expect(NumeriRomani.to_roman(1 + 10/12r)).to eq 'IS∷'
      expect(NumeriRomani.to_roman(1 + 11/12r)).to eq 'IS⁙'
    end

    it 'should correct coerce into tvelfth fractions' do
      expect(NumeriRomani.to_roman(0.09)).to eq '⋅'
      expect(NumeriRomani.to_roman(0.10)).to eq '⋅'
      expect(NumeriRomani.to_roman(0.11)).to eq '⋅'
      expect(NumeriRomani.to_roman(0.12)).to eq '⋅'
      expect(NumeriRomani.to_roman(0.13)).to eq '∶' # 0.13 ~ 2/12
    end
  end

  describe '.to_decimal' do
    describe 'input validation' do
      it 'should raise error for invalid data' do
        expect { NumeriRomani.to_decimal('qwerty') }.to raise_error(ArgumentError)
        expect { NumeriRomani.to_decimal('IDDM') }.to raise_error(ArgumentError)
        expect { NumeriRomani.to_decimal('II̅X̅DDM') }.to raise_error(ArgumentError)
        expect { NumeriRomani.to_decimal('M̅L̅M̅C̅L̅') }.to raise_error(ArgumentError)
      end

      it 'should raise error for invalid fraction data' do
        expect { NumeriRomani.to_decimal('ISS') }.to raise_error(ArgumentError)
        expect { NumeriRomani.to_decimal('IS∷∷') }.to raise_error(ArgumentError)
        expect { NumeriRomani.to_decimal('I∷S') }.to raise_error(ArgumentError)
        expect { NumeriRomani.to_decimal('∴SI') }.to raise_error(ArgumentError)
        expect { NumeriRomani.to_decimal('I*S') }.to raise_error(ArgumentError)
        expect { NumeriRomani.to_decimal('⋅*') }.to raise_error(ArgumentError)
        expect { NumeriRomani.to_decimal('******') }.to raise_error(ArgumentError)
      end
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
      expect(NumeriRomani.to_decimal('MMXVII')).to eq 2_017
      expect(NumeriRomani.to_decimal('MMMCMXCVIII')).to eq 3_998
      expect(NumeriRomani.to_decimal('I̅V̅')).to eq 4_000
      expect(NumeriRomani.to_decimal('X̅X̅M')).to eq 21_000
      expect(NumeriRomani.to_decimal('C̅V̅MMMDLXIII')).to eq 108_563
      expect(NumeriRomani.to_decimal('M̅C̅C̅X̅X̅X̅I̅V̅DLXVII')).to eq 1_234_567
    end

    it 'should convert fractions' do
      expect(NumeriRomani.to_decimal('IVS')).to eq 4.5
      expect(NumeriRomani.to_decimal('VIIIS⁙')).to eq (8 + 11/12r)
      expect(NumeriRomani.to_decimal('VIIIS*****')).to eq (8 + 11/12r)
      expect(NumeriRomani.to_decimal('XIIS∶')).to eq (12 + 2/3r)
      expect(NumeriRomani.to_decimal('XIIS**')).to eq (12 + 2/3r)
      expect(NumeriRomani.to_decimal('XVIII∴')).to eq 18.25
      expect(NumeriRomani.to_decimal('XVIII***')).to eq 18.25
      expect(NumeriRomani.to_decimal('XXIX⋅')).to eq (29 + 1/12r)
      expect(NumeriRomani.to_decimal('XXIX*')).to eq (29 + 1/12r)
      expect(NumeriRomani.to_decimal('X̅X̅M∷')).to eq (21_000 + 1/3r)
      expect(NumeriRomani.to_decimal('X̅X̅M****')).to eq (21_000 + 1/3r)
    end
  end
end
