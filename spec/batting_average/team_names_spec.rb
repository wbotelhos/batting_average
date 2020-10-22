# frozen_string_literal: true

RSpec.describe BattingAverage, '#team_names' do
  subject(:batting_average) { described_class.new }

  let!(:stints) do
    [
      { team_name: 'A' },
      { team_name: 'C' },
      { team_name: 'B' },
    ]
  end

  it "returns team names separated by commas and sorted" do
    expect(batting_average.team_names(stints)).to eq 'A, B, C'
  end
end
