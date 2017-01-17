class Team < ActiveRecord::Base
  has_many :playbooks
  has_many :players, through: :playbooks

  has_many :home, class_name: "Match",
                                  foreign_key: "team1_id",
                                  dependent: :destroy
  has_many :away, class_name: "Match",
                                   foreign_key: "team2_id",
                                   dependent: :destroy
  has_many :home_games, through: :home, source: :team1
  has_many :away_games, through: :away, source: :team2
  accepts_nested_attributes_for :playbooks
end
