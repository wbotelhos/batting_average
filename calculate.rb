require 'csv'
require 'optparse'
require 'terminal-table'

require_relative 'batting_average'

options = { filters: {} }

OptionParser.new do |opts|
  opts.banner = 'Usage: ruby calculate.rb [options]'

  opts.on('--batting_file_path=PATH', 'Batting CSV path (./data/Batting.csv)') do |value|
    options[:batting_file_path] = value
  end

  opts.on('--teams_file_path=PATH', 'Teams CSV path (./data/Teams.csv)') do |value|
    options[:teams_file_path] = value
  end

  opts.on('--filter-year=YEAR', 'Filter by Year (1991)') do |value|
    options[:filters][:year] = value
  end

  opts.on('--filter-team-name=NAME', "Filter by Team Name ('New York Mets')") do |value|
    options[:filters][:team_name] = value
  end
end.parse!

unless options[:batting_file_path]
  puts '--batting_file_path=PATH required! Check: `ruby calculate.rb --help`'

  exit 1
end

unless options[:teams_file_path]
  puts '--teams_file_path=PATH required! Check: `ruby calculate.rb --help`'

  exit 1
end

BattingAverage
  .new(batting_path: options[:batting_file_path], filters: options[:filters], teams_path: options[:teams_file_path])
  .print_table
