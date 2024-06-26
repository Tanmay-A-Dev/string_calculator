require 'rspec'
require_relative '../string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    it 'returns 0 for an empty string' do
      expect(subject.add("")).to eq(0)
    end

    it 'returns the number for a single number string' do
      expect(subject.add("1")).to eq(1)
    end

    it 'returns the sum for two numbers separated by comma' do
      expect(subject.add("1,5")).to eq(6)
    end

    it 'handles new lines between numbers' do
      expect(subject.add("1\n2,3")).to eq(6)
    end

    it 'supports different delimiters' do
      expect(subject.add("//;\n1;2")).to eq(3)
    end

    it 'throws an exception for negative numbers' do
      expect { subject.add("1,-2") }.to raise_error(RuntimeError, "negative numbers not allowed -2")
    end

    it 'throws an exception for multiple negative numbers' do
      expect { subject.add("-1,-2") }.to raise_error(RuntimeError, "negative numbers not allowed -1,-2")
    end
  end
end
