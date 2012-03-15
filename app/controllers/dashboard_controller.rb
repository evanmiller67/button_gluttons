class DashboardController < ApplicationController
  layout "dashboard"

  def leaderboard
    @players = Player.winners
  end
end
