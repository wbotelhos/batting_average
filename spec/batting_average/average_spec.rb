# frozen_string_literal: true

RSpec.describe BattingAverage, '#average' do
  it 'returns average with 3 decimal values' do
    expect(described_class.new.average(4, 3)).to eq '1.333'
  end

  context 'when divider is zero' do
    it 'returns zero' do
      expect(described_class.new.average(4, 0)).to eq '0.000'
    end
  end
end
