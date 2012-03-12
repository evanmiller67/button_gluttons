class FightsController < ApplicationController
  def index
    @fight_count = Fight.registered.count

    respond_to do |format|
      format.html
    end
  end

  def show
    @fight = Fight.find(params[:id])
    @round = @fight.rounds.last

    respond_to do |format|
      format.html
      format.json { render json: @fight }
    end
  end

  def update
    @fight = Fight.find(params[:id])

    # update the round with the latest roll

    # is this round over?

    # is this fight over?

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