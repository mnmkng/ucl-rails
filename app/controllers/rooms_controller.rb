class RoomsController < ApplicationController

  permits :title, :code, :building_id

  def index
    @rooms = Room.all
    @buildings = Building.includes(:rooms)
  end

  def show(id)
    @room = Room.includes(lessons: [:course]).find(id)
  end

end
