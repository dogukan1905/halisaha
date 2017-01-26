class Vote < ApplicationRecord
  belongs_to :match
  has_many :votings
  has_many :player, through: :votings
  accepts_nested_attributes_for :votings

  validates_numericality_of :match_point, :less_than_or_equal_to => 10

  before_create :update_user_attrs

  private

    def update_user_attrs
      self.player_points.each do |player_id, attrs|
        player_votes_count = Vote.where(player_id: player_id).all.count

        player = Player.find player_id
        player.attack = calculate_new_scores(player.attack, player_votes_count, attrs["attack"])
        player.defense = calculate_new_scores(player.defense, player_votes_count, attrs["defense"])
        player.passion = calculate_new_scores(player.passion, player_votes_count, attrs["passion"])
        return false unless player.save
      end
    end

    def calculate_new_scores(previous_score, total_count, new_vote)
      new_score = ((previous_score * total_count) + calcuate_score_with_match_point(new_vote.to_f))/(total_count + 1)
    end

    def calcuate_score_with_match_point(vote)
      weighted_score = vote*(0.9 + self.match_point/100)
    end
end
