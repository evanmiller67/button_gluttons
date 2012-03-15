class PlayersController < ApplicationController
  before_filter :game_status

  def show
    # Player account registered
    if @player.is_registered? && cookies[:player_id].to_i == @player.id
      # Show stats
      respond_to do |format|
        format.html
        format.json { render json: @player }
      end

    elsif @player.is_registered? && cookies[:player_id].blank?
      # New Device

    elsif @player.is_registered? && cookies[:player_id].to_i != @player.id
      # FIGHT!
      # Is this player already in a fight?
      @fight = Fight.where("started_by_id = :started_by AND status = 'i'", {:started_by => @player.id}).first

      if @fight
        @fight.status = 'fighting'
        @fight.rounds.create
        @fight.save
      else
        @fight = Fight.create(:started_by => Player.find(cookies[:player_id]), :opponent => @player)
      end

      redirect_to @fight

    # Player account NOT registered
    elsif !@player.is_registered? && cookies[:player_id].to_i == @player.id
      # This shouldn't happen!
      redirect_to :root, notice: "Unknow thing occurred - please try again."
    elsif !@player.is_registered? && !cookies[:player_id].blank? && (cookies[:player_id].to_i != @player.id)
      # Can't fight an unregistered player
      redirect_to :root, info: "Cant fight an unarmed opponent.  Please ask them to register."
    elsif !@player.is_registered? && cookies[:player_id].blank?
      # Register new player
      redirect_to :edit_player, info: "Please complete the registration to continue"
    else
      # Something weird happend
      redirect_to :root, error: "Unknown error occurred - please try again."
    end
  end


  def edit
    if cookies[:player_id].blank? || cookies[:player_id] == @player.id
      # proceed
    else
      redirect_to :root, error: "No editing allowed!"
    end
  end


  def update
    cookies[:player_id] = @player.id

    registered = @player.is_registered?
    @player.is_registered = true

    respond_to do |format|
      if @player.update_attributes(params[:player])
        Twitter.update("#{@player.full_name} just registered to play Button Gluttons! http://buttongluttons.com/") unless registered
        format.html { redirect_to @player }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Is the game closed to players right now?
  def game_status
    @player = Player.find(params[:id])

    unless @player.is_boss?
      redirect_to :root, :notice => "Sorry, the game is closed right now.  Please try again later."
      return false
    end
  end
end
