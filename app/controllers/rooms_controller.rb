class RoomsController < ApplicationController

  permits :title, :code, :building_id

  def index
    @rooms = Room.all
    @buildings = Building.all
  end

  def show(id)
    @room = Room.find(id)
  end

end
