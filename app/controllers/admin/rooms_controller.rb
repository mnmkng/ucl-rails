module Admin
  class RoomsController < AdminController

    before_action :set_room, only: [:show, :edit, :update, :destroy]

    permits :title, :code, :building_id

    def index
      @rooms = Room.includes(:building)
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
        redirect_to admin_rooms_path, notice: 'Room was successfully created.'
      else
        render :new
      end
    end

    def update(room)
      if @room.update(room)
        redirect_to admin_rooms_path, notice: 'Room was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @room.destroy
      redirect_to admin_rooms_url, notice: 'Room was successfully destroyed.'
    end

    private
    def set_room(id)
      @room = Room.includes(lessons: [:course]).find(id)
    end

  end

end