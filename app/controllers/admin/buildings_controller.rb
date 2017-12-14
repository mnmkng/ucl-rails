module Admin
  class BuildingsController < AdminController

    before_action :set_building, only: [:show, :edit, :update, :destroy]

    permits :title, :code

    def index
      @buildings = Building.all
    end

    def show
    end

    def new
      @building = Building.new
    end

    def edit
    end

    def create(building)
      @building = Building.new(building)

      if @building.save
        redirect_to admin_buildings_path, notice: 'Building was successfully created.'
      else
        render :new
      end
    end

    def update(building)
      if @building.update(building)
        redirect_to admin_buildings_path, notice: 'Building was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @building.destroy
      redirect_to admin_buildings_url, notice: 'Building was successfully destroyed.'
    end

    private
    def set_building(id)
      @building = Building.find(id)
    end

  end

end