class DashboardController < ApplicationController
  layout "dashboard"

  def leaderboard
    @players = Player.registered.limit(1)
  end
end
