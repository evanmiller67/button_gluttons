class DashboardController < ApplicationController
  layout "dashboard"

  def leaderboard
    @players  = Player.winners
    @bosses   = Player.bosses

    @registered_players = Player.registered.count
    @registered_bosses  = Player.where(:is_boss => true).count
  end
end
