module Admin
  class RoomsController < ApplicationController

    before_action :set_room, only: [:show, :edit, :update, :destroy]

    permits :title, :code, :building_id

    def index
      @rooms = Room.all
    end

    def show
    end

    def new
      @room = Room.new
    end

    def edit
    end

    def create(room)
      @room = Room.new(room)

      if @room.save
        redirect_to rooms_path, notice: 'Room was successfully created.'
      else
        render :new
      end
    end

    def update(room)
      if @room.update(room)
        redirect_to rooms_path, notice: 'Room was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @room.destroy
      redirect_to rooms_url, notice: 'Room was successfully destroyed.'
    end

    private
    def set_room(id)
      @room = Room.find(id)
    end

  end

end