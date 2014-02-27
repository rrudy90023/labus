class RidersController < ApplicationController
  before_action :set_rider, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /riders
  # GET /riders.json
  def index
    @riders = Rider.all
  end

  # GET /riders/1
  # GET /riders/1.json
  def show
  end

  # GET /riders/new
  def new
    @rider = current_user.riders.build
  end

  # GET /riders/1/edit
  def edit
  end

  # POST /riders
  # POST /riders.json
  def create
    @rider = current_user.riders.build(rider_params)

      if @rider.save
      redirect_to @rider, notice: 'Rider was successfully created.' 

      else
      render action: 'new' 

    end
  end

  # PATCH/PUT /riders/1
  # PATCH/PUT /riders/1.json
  def update

    if @rider.update(rider_params)
     redirect_to @rider, notice: 'Rider was successfully updated.'
 
      else
      render action: 'edit'
    end


  # DELETE /riders/1
  # DELETE /riders/1.json
  def destroy
    @rider.destroy
    redirect_to riders_url

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rider
      @rider = Rider.find(params[:id])
    end



    def correct_user

      @rider = current_user.riders.find_by(id: params[:id])
      redirect_to riders_path, notice: "Not Authorize to edit this rider" if @rider.nil?
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def rider_params
      params.require(:rider).permit(:story, :bus, :busline)
    end
end
