# frozen_string_literal: true

RSpec.describe BattingAverage, '#teams' do
  subject(:batting_average) { described_class.new(teams_path: 'spec/fixtures/Teams.csv') }

  it "extract teams data" do
    expect(batting_average.teams).to eq(
      "BS1" => "Boston Red Stockings",
      "CH1" => "Chicago White Stockings",
      "CL1" => "Cleveland Forest Citys",
    )
  end
end
