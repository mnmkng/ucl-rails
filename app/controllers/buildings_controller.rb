class BuildingsController < ApplicationController

  permits :title, :code

  def index
    @buildings = Building.all
  end

  def show(id)
    @building = Building.find(id)
  end

end
