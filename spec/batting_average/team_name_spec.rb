# frozen_string_literal: true

RSpec.describe BattingAverage, '#team_name' do
  subject(:batting_average) { described_class.new(teams_path: 'spec/fixtures/Teams.csv') }

  it "extract the team name" do
    expect(batting_average.team_name('BS1')).to eq "Boston Red Stockings"
  end
end
