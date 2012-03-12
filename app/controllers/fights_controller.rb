class FightsController < ApplicationController
  def index
    @fight_count = Fight.registered.count

    respond_to do |format|
      format.html
    end
  end

  def show
    @fight = Fight.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @fight }
    end
  end

  def new
    @fight = Fight.new

    respond_to do |format|
      format.html
      format.json { render json: @fight }
    end
  end

  def edit
    @fight = Fight.find(params[:id])
  end

  def create
    @fight = Fight.new(params[:fight])

    respond_to do |format|
      if @fight.save
        format.html { redirect_to @fight, notice: 'Fight was successfully created.' }
        format.json { render json: @fight, status: :created, location: @fight }
      else
        format.html { render action: "new" }
        format.json { render json: @fight.errors, status: :unprocessable_entity }
      end
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

  def destroy
    @fight = Fight.find(params[:id])
    @fight.destroy

    respond_to do |format|
      format.html { redirect_to fights_url }
      format.json { head :no_content }
    end
  end
end