json.extract! vote, :id, :match_point, :player_points, :match_id, :player_id, :created_at, :updated_at
json.url vote_url(vote, format: :json)