class PlayersController < ApplicationController
  before_filter :game_status

  def show
    if cookies[:player_id].blank? && @player.is_registered?
      # new device
      render :confirm, notice: "Please register this device"

    elsif cookies[:player_id].blank? && !@player.is_registered?
      # register
      redirect_to :edit_player, notice: "Please complete the registration to continue"

    elsif @player.is_registered? && cookies[:player_id].to_i == @player.id
      # Show stats
      respond_to do |format|
        format.html
        format.json { render json: @player }
      end

    elsif @player.is_registered? && cookies[:player_id].to_i != @player.id
      # FIGHT!
      roll = rand(20)
      
      # Did we start this fight or are we finishing it? 
      @fight = Fight.where(:started_by_id => @player)

      if @fight.blank?
        # We are starting this fight!
        @fight = Fight.create(
          :started_by       => Player.find(cookies[:player_id]), 
          :opponent         => @player,
          :started_by_roll  => roll
          )
      else
        # We are finishing this fight!
        @fight.opponent_roll  = roll
        @fight.active         = false
        @fight.save
      end

      # Is this player already in a fight?
      # @fight = Fight.where("started_by_id = :started_by AND status = 'i'", {:started_by => @player.id}).first
      # @fight = Fight.where("started_by_id = ? OR opponent_id = ?", @player, @player)

      redirect_to @fight

    # elsif !@player.is_registered? && cookies[:player_id].to_i == @player.id
    #   # This shouldn't happen!
    #   redirect_to :root, notice: "Unknow thing occurred - please try again."

    elsif !@player.is_registered? && cookies[:player_id].to_i != @player.id
      # Can't fight an unregistered player
      redirect_to :root, notice: "Cant fight an unarmed opponent.  Please ask them to register."

    else
      # Something weird happend
      redirect_to :root, alert: "Unknown error occurred - please try again."
    end
  end

  def edit
    if cookies[:player_id].blank? || cookies[:player_id] == @player.id
      # proceed
    else
      redirect_to :root, alert: "No editing allowed!"
    end
  end

  def update
    if @player.is_registered? && params[:player][:email_address] != @player.email_address
        redirect_to :root, alert: "Device not registered.  Are you sure you own this account?"
    else
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
