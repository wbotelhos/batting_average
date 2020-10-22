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

  def extract_players
    [].tap do |result|
      CSV.foreach(@batting_path, converters: :numeric, headers: true) do |row|
        result << {
          ab:        row['AB'],
          h:         row['H'],
          player_id: row['playerID'],
          team_name: row['teamID'],
          year_id:   row['yearID']
        }
      end
    end
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
