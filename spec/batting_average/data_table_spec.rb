# frozen_string_literal: true

RSpec.describe BattingAverage, '#data_table' do
  subject(:batting_average) { described_class.new }

  let!(:data) do
    [
      {
        batting_average: "0.000",
        identity:        "player_id:abercda01,year_id:1871",
        player_id:       "abercda01",
        team_names:      "Troy Haymakers",
        year_id:         1871,
      },

      {
        batting_average: "0.271",
        identity:        "player_id:addybo01,year_id:1871",
        player_id:       "addybo01",
        team_names:      "Rockford Forest Citys",
        year_id:         1871,
      }
    ]
  end

  before { allow(batting_average).to receive(:players_average).and_return(data) }

  it "extract players data" do
    expect(batting_average.data_table).to eq [
      ['abercda01', 1871, 'Troy Haymakers', '0.000'],
      ['addybo01', 1871, 'Rockford Forest Citys', '0.271'],
    ]
  end
end
