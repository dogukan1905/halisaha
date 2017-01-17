class Goal < ActiveRecord::Base
	belongs_to :player, counter_cache: true
	belongs_to :match, counter_cache: true
end
