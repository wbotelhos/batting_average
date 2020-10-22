# frozen_string_literal: true

RSpec.describe BattingAverage, '#print_table' do
  subject(:batting_average) { described_class.new }

  let!(:data) do
    [
      ['abercda01', 1871, 'Troy Haymakers', '0.000'],
      ['addybo01', 1871, 'Rockford Forest Citys', '0.271'],
    ]
  end

  before { allow(batting_average).to receive(:data_table).and_return(data) }

  it "extract players data" do
    output = <<~HEREDOC
      +-----------+--------+-----------------------+-----------------+
      | playerID  | yearId | Team name(s)          | Batting Average |
      +-----------+--------+-----------------------+-----------------+
      | abercda01 | 1871   | Troy Haymakers        | 0.000           |
      | addybo01  | 1871   | Rockford Forest Citys | 0.271           |
      +-----------+--------+-----------------------+-----------------+
    HEREDOC

    expect { batting_average.print_table }.to output(output).to_stdout
  end
end
