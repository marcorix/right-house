class HousesController < ApplicationController
  before_action :set_house, only: %i[ show edit update destroy ]

  # GET /houses
  def index
    if params[:query].present?
      @houses = House.search_by_name_and_location(params[:query])
    else
      @houses = House.all
    end
    @house = House.new
  end

  # GET /houses/1
  def show
    @booking = Booking.new
  end

  # GET /houses/new
  def new
    @house = House.new
  end

  # GET /houses/1/edit
  def edit
  end

  # POST /houses
  def create
    @house = House.new(house_params)
    @house.user = current_user

    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: "House was successfully created." }
        format.json
      else
        format.html { render :new, status: :unprocessable_entity}
        format.json
      end
    end
  end

  # PATCH/PUT /houses/1
  def update
    if @house.update(house_params)
      redirect_to @house, notice: "House was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /houses/1
  def destroy
    @house.destroy
    redirect_to houses_url, notice: "House was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def house_params
      params.require(:house).permit(:name, :location, :house_type, :bedrooms, :guests, :price, :photo)
    end
end
