class Comment < ActiveRecord::Base
  belongs_to :player, counter_cache: true
end
