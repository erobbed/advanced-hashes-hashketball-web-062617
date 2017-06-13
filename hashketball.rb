require "pry"

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {:number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
        "Reggie Evans" => {:number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
        "Brook Lopez" => {:number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
        "Mason Plumlee" => {:number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
        "Jason Terry" => {:number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {:number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
        "Bismak Biyombo" => {:number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10},
        "DeSagna Diop" => {:number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
        "Ben Gordon" => {:number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1 , :slam_dunks => 0},
        "Brendan Haywood" => {:number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12}
      }
    }
  }
end


def num_points_scored(player_name)

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player == player_name
            return stats[:points]
          end
        end
      end
    end
  end
end


def shoe_size(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player == player_name
            return stats[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if team_data[:team_name] == team_name
            return team_data[:colors]
      end
    end
  end
end

def team_names
  teams = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
      teams.push(team_data[:team_name])
      end
    end
  end
  teams
end


def player_numbers(team_name)
jersey = []
game_hash.each do |location, team_data|
  team_data.each do |attribute, data|
    if (team_data[:team_name] == team_name && attribute == :players)
      data.each do |player, stats|
          jersey.push(stats[:number])
        end
      end
    end
  end
jersey
end


def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player == player_name
            return stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        shoe_size = (data.sort_by {|player, stats| stats[:shoe]}.reverse)
        return shoe_size[0][1][:rebounds]
      end
    end
  end
end

def most_points_scored
  top_scorer = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        most_points = (data.sort_by {|player, stats| stats[:points]}.reverse)
        top_scorer.push(most_points[0])
      end
    end
  end
  mvp = (top_scorer.sort_by {|player, stats| stats[:points]}.reverse)[0][0]
end

def winning_team
  home_team = []
  away_team = []
  game_hash.each do |location, team_data|
    case location
    when :home
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |player, stats|
            home_team.push(stats[:points])
          end
        end
      end
    when :away
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |player, stats|
            away_team.push(stats[:points])
          end
        end
      end
    end
  end
  winning_team = {
    "#{game_hash[:home][:team_name]}" => home_team.inject(:+),
    "#{game_hash[:away][:team_name]}" => away_team.inject(:+)
  }
  (winning_team.sort_by {|team, score| score})[-1][0]
end

def player_with_longest_name
  long_names = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        name_length = (data.sort_by {|player, stats| player.length }.reverse)
        long_names.push(name_length[0])
      end
    end
  end
  longest_name = (long_names.sort_by {|player, stats| player.length}.reverse)[0][0]
end

def long_name_steals_a_ton?
  long_names = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        name_length = (data.sort_by {|player, stats| player.length }.reverse)
        long_names.push(name_length[0])
      end
    end
  end
  longest_name = (long_names.sort_by {|player, stats| player.length}.reverse)[0][0]

  ball_thief = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        most_steals = (data.sort_by {|player, stats| stats[:steals]}.reverse)
        ball_thief.push(most_steals[0])
      end
    end
  end
  top_ball_thief = (ball_thief.sort_by {|player, stats| stats[:steals]}.reverse)[0][0]
  if top_ball_thief == longest_name
    return true
  end
end
