# frozen_string_literal: true

RSpec.describe BattingAverage, '#players_by_year' do
  subject(:batting_average) { described_class.new(batting_path: 'spec/fixtures/Batting.csv') }

  it 'extract players data' do
    expect(batting_average.players_by_year).to eq(
      'abercda01:1872' => [
        { ab: 4, h: 0, player_id: 'abercda01', team_name: 'Troy Haymakers', year_id: 1872 },
      ],

      'addybo01:1873' => [
        { ab: 118, h: 32, player_id: 'addybo01', team_name: 'Rockford Forest Citys', year_id: 1873 },
      ],

      'allisar01:1871' => [
        { ab: 137, h: 40, player_id: 'allisar01', team_name: 'Cleveland Forest Citys', year_id: 1871 },
        { ab: 137, h: 40, player_id: 'allisar01', team_name: 'Cleveland Blues', year_id: 1871 },
      ]
    )
  end
end
