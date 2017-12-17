class RoomsController < ApplicationController

  permits :title, :code, :building_id

  def index
    @rooms = Room.all
    @buildings = Building.includes(:rooms)
  end

  def show(id)
    @room = Room.find(id)
  end

end
