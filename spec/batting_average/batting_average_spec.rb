# frozen_string_literal: true

RSpec.describe BattingAverage, '#batting_average' do
  subject(:batting_average) { described_class.new }

  let!(:stints) do
    [
      { ab: 2,  h: 1 },
      { ab: 23, h: 2 },
      { ab: 42, h: 3 },
    ]
  end

  it 'returns team names separated by commas and sorted' do
    expect(batting_average.batting_average(stints)).to eq '0.090' # # 0,08955223881
  end
end
