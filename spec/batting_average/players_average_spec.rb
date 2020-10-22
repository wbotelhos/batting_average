# frozen_string_literal: true

RSpec.describe BattingAverage, '#players_average' do
  subject(:batting_average) { described_class.new }

  let!(:data) do
    {
      "abercda01:1871" => [
        { ab: 4, h: 0, player_id: "abercda01", team_name: "Troy Haymakers", year_id: 1871 }
      ],

      "addybo01:1871" => [
        { ab: 118, h: 32, player_id: "addybo01", team_name: "Rockford Forest Citys", year_id: 1871 }
      ],

      "allisar01:1871" => [
        { ab: 137, h: 40, player_id: "allisar01", team_name: "Cleveland Forest Citys", year_id: 1871 },
        { ab: 137, h: 40, player_id: "allisar01", team_name: "Cleveland Blues", year_id: 1871 },
      ]
    }
  end

  before { allow(batting_average).to receive(:players_by_year).and_return(data) }

  it "extract players data sorted by average" do
    expect(batting_average.players_average).to eq [
      {
        batting_average: "0.292",
        identity:        "allisar01:1871",
        player_id:       "allisar01",
        team_names:      "Cleveland Blues, Cleveland Forest Citys",
        year_id:         1871,
      },

      {
        batting_average: "0.271",
        identity:        "addybo01:1871",
        player_id:       "addybo01",
        team_names:      "Rockford Forest Citys",
        year_id:         1871,
      },

      {
        batting_average: "0.000",
        identity:        "abercda01:1871",
        player_id:       "abercda01",
        team_names:      "Troy Haymakers",
        year_id:         1871,
      },
    ]
  end
end
