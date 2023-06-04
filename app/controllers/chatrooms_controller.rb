class ChatroomsController < ApplicationController

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @receiver = current_user == @chatroom.booking.user ? @chatroom.booking.house.user : @chatroom.booking.user
  end
end
