# frozen_string_literal: true

require 'csv'

class BattingAverage
  def initialize(batting_path: 'Batting.csv', teams_path: 'Teams.csv')
    @batting_path = batting_path
    @teams_path   = teams_path
  end

  def average(h, ab)
    sprintf('%.3f', h.to_f / ab)
  end

  def batting_average(stints)
    ab_sum = stints.sum { |data| data[:ab] }
    h_sum  = stints.sum { |data| data[:h] }

    average(h_sum, ab_sum)
  end

  def extract_players
    [].tap do |result|
      CSV.foreach(@batting_path, converters: :numeric, headers: true) do |row|
        result << {
          ab:        row['AB'],
          h:         row['H'],
          player_id: row['playerID'],
          team_name: team_name(row['teamID']),
          year_id:   row['yearID']
        }
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
    end
  end

  def players_by_year
    extract_players.group_by { |item| "player_id:#{item[:player_id]},year_id:#{item[:year_id]}" }
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
end
