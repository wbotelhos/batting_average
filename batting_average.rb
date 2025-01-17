# frozen_string_literal: true

require 'csv'
require 'terminal-table'

class BattingAverage
  def initialize(batting_path: 'data/Batting.csv', filters: {}, teams_path: 'data/Teams.csv')
    @batting_path = batting_path
    @filters      = filters
    @teams_path   = teams_path
  end

  def average(h, ab)
    value = ab.positive? ? h.to_f / ab : 0

    format('%.3f', value)
  end

  def batting_average(stints)
    ab_sum = stints.sum { |data| data[:ab] }
    h_sum  = stints.sum { |data| data[:h] }

    average(h_sum, ab_sum)
  end

  def data_table
    players_average.map do |data|
      [
        data[:player_id],
        data[:year_id],
        data[:team_names],
        data[:batting_average],
      ]
    end
  end

  def players
    @players ||= begin
      [].tap do |result|
        CSV.foreach(@batting_path, converters: :numeric, headers: true) do |row|
          year      = row['yearID']
          team_name = team_name(row['teamID'])

          if allowed?(year, team_name)
            result << {
              ab:        row['AB'],
              h:         row['H'],
              player_id: row['playerID'],
              team_name: team_name,
              year_id:   year,
            }
          end
        end
      end
    end
  end

  def players_average
    players_by_year.map do |identity, stints|
      {
        batting_average: batting_average(stints),
        identity:        identity,
        player_id:       stints.first[:player_id],
        team_names:      team_names(stints),
        year_id:         stints.first[:year_id],
      }
    end.sort_by { |data| data[:batting_average] }.reverse
  end

  def players_by_year
    players.group_by { |item| "#{item[:player_id]}:#{item[:year_id]}" }
  end

  def print_table
    puts Terminal::Table.new(headings: ['playerID', 'yearId', 'Team name(s)', 'Batting Average'], rows: data_table)
  end

  def team_name(team_id)
    teams[team_id]
  end

  def team_names(stints)
    stints.map { |data| data[:team_name] }.sort.join(', ')
  end

  def teams
    @teams ||= begin
      {}.tap do |result|
        CSV.foreach(@teams_path, headers: true) do |row|
          result[row['teamID']] ||= row['name']
        end
      end
    end
  end

  private

  def allowed?(year, team_name)
    return true if @filters.empty?

    year == @filters.fetch(:year, year).to_i && team_name == @filters.fetch(:team_name, team_name)
  end
end
