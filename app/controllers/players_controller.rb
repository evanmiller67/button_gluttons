class PlayersController < ApplicationController
  def index
    @player_count = Player.registered.count

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @player   = Player.find(params[:id])

    # Player account registered
    if @player.is_registered? && cookies[:player_id].to_i == @player.id
      # Show stats
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @player }
      end
    elsif @player.is_registered? && cookies[:player_id].to_i != @player.id
      # FIGHT!
      redirect_to :new_fight
    elsif @player.is_registered? && cookies[:player_id].blank?
      # New Device

    # Player account NOT registered
    elsif !@player.is_registered? && cookies[:player_id].to_i == @player.id
      # This shouldn't happen!
      redirect_to :root, notice: "Unknow thing occurred - please try again."
    elsif !@player.is_registered? && cookies[:player_id].to_i != @player.id
      # Can't fight an unregistered player
      redirect_to :root, notice: "Cant fight an unarmed opponent.  Please ask them to register."
    elsif !@player.is_registered? && cookies[:player_id].blank?
      # Register new player
      redirect_to :edit_player, notice: "Please complete the registration to continue"
    else
      # Something weird happend
      redirect_to :root, notice: "Unknown error occurred - please try again."
    end
  end

  # GET /players/1/edit
  def edit
    @player = Player.find(params[:id])
    
    redirect_to :root, notice: "You don't own this account" unless @player.is_registered && cookies[:player_id].to_i == @player.id
  end


  def update
    @player = Player.find(params[:id])
    @player.is_registered = true
    cookies[:player_id] = @player.id

    respond_to do |format|
      if @player.update_attributes(params[:player])
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player = Player.find(params[:id])
    @player.destroy

    respond_to do |format|
      format.html { redirect_to players_url }
      format.json { head :no_content }
    end
  end
end
