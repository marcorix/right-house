class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @house = House.find(params[:house_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.house = @house

    if @booking.save
      @chatroom = Chatroom.new
      @chatroom.booking = @booking
      @chatroom.save!
      redirect_to booking_path(@booking)
    else
      redirect_to :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
