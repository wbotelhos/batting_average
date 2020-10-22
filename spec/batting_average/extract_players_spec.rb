# frozen_string_literal: true

RSpec.describe BattingAverage, '#extract_players' do
  subject(:batting_average) { described_class.new('spec/fixtures/Batting.csv', 'spec/fixtures/Batting.csv') }

  it "extract players data" do
    expect(batting_average.extract_players).to eq [
       { ab: 4, h: 0, player_id: "abercda01", team_name: "TRO", year_id: 1871 },
       { ab: 118, h: 32, player_id: "addybo01", team_name: "RC1", year_id: 1871 },
       { ab: 137, h: 40, player_id: "allisar01", team_name: "CL1", year_id: 1871 }
    ]
  end
end
