# frozen_string_literal: true

RSpec.describe BattingAverage, '#players' do
  context 'whithout filters' do
    subject(:batting_average) { described_class.new(batting_path: 'spec/fixtures/Batting.csv') }

    it "extract players data" do
      expect(batting_average.players).to eq [
        { ab: 4, h: 0, player_id: "abercda01", team_name: "Troy Haymakers", year_id: 1872 },
        { ab: 118, h: 32, player_id: "addybo01", team_name: "Rockford Forest Citys", year_id: 1873 },
        { ab: 137, h: 40, player_id: "allisar01", team_name: "Cleveland Forest Citys", year_id: 1871 },
        { ab: 137, h: 40, player_id: "allisar01", team_name: "Cleveland Blues", year_id: 1871 },
      ]
    end
  end

  context 'with filter' do
    subject(:batting_average) { described_class.new(batting_path: 'spec/fixtures/Batting.csv', filters: filters) }

    context 'when year filter is given' do
      let(:filters) { { year: 1871 } }

      it "extract players data" do
        expect(batting_average.players.map { |item| item[:player_id] }).to eq ["allisar01", "allisar01"]
      end
    end

    context 'when team_name is given' do
      let(:filters) { { team_name: 'Troy Haymakers' } }

      it "extract players data" do
        expect(batting_average.players.map { |item| item[:player_id] }).to eq ["abercda01"]
      end
    end

    context 'when year and team_name is given' do
      let(:filters) { { year: 1873, team_name: 'Rockford Forest Citys' } }

      it "extract players data" do
        expect(batting_average.players.map { |item| item[:player_id] }).to eq ["addybo01"]
      end
    end
  end
end
