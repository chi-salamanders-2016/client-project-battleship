class LeaderboardsController < ApplicationController
	def index
		@most_user_wins = User.all.sort {|a,b| a.games_won <=> b.games_won}
		@most_user_shots = User.all.sort {|a,b| a.total_shots_fired <=> b.total_shots_fired}
		@most_user_win_ratio = User.all.sort {|a,b| a.total_shots_fired <=> b.total_shots_fired}
		@most_user_accuracy = User.all.sort {|a,b| a.calculate_accuracy <=> b.calculate_accuracy}
	end
end