class DashboardController < ApplicationController
  layout "dashboard"

  def leaderboard
    @players  = Player.winners
    @bosses   = Player.bosses
  end
end
