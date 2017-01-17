class Match < ActiveRecord::Base
  belongs_to :team1, class_name: "Team"
  belongs_to :team2, class_name: "Team"
  validates :team1_id, presence: true
  validates :team2_id, presence: true
  has_many :goals
  has_one :best_goal, class_name: "Goal"
  belongs_to :best_goal, class_name: "Goal",
                        foreign_key: "best_goal_id"

  accepts_nested_attributes_for :teams
  accepts_nested_attributes_for :goals
end
