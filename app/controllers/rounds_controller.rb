class RoundsController < ApplicationController
  def show
    @round = Round.find(params[:id])
  end

  def update
    @round = Round.find(params[:id])

    # Who submitted the update for this round?
    if cookies[:player_id].to_i == @round.fight.opponent.id
      @round.opponent_roll = params[:round][:started_by_roll]
      params[:round].delete(:started_by_roll)
    end

    # is this fight over?

    respond_to do |format|
      if @round.update_attributes(params[:round])
        # is the round over?
        if !@round.started_by_roll.blank? && !@round.opponent_roll.blank?
          # create a new round
          @next_round = @round.fight.rounds.create
          format.html { redirect_to @next_round, notice: 'Someone won that round!'}
          format.json { head :no_content }
        else
          format.html { redirect_to @round, notice: 'Round was successfully updated.' }
          format.json { head :no_content }
        end
      else
        format.html { render action: "edit" }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  # def status
  #   respond_to do |format|
  #     format.html { notice: 'Waiting on opponent' }
  #     format.json { render json: {:status => 'waiting'} }
  #   end
  # end

end
