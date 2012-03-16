class FightsController < ApplicationController
  def index
    @fight_count = Fight.registered.count

    respond_to do |format|
      format.html
    end
  end

  def show
    @fight    = Fight.find(params[:id])
    @player   = Player.find(cookies[:player_id].to_i)
    @opponent = @fight.started_by_id == @player.id ? 
                  Player.find(@fight.opponent_id) : 
                  Player.find(@fight.started_by_id)

    @player_score   = @fight.score(@player)
    @opponent_score = @fight.score(@opponent)
    @winlose        = @player_score > @opponent_score ? "lose" : "win"

    respond_to do |format|
      format.html
      format.json { render json: @fight }
    end
  end

  def update
    @fight = Fight.find(params[:id])

    respond_to do |format|
      if @fight.update_attributes(params[:fight])
        format.html { redirect_to @fight, notice: 'Fight was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fight.errors, status: :unprocessable_entity }
      end
    end
  end
end