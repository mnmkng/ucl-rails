class LessonListController < ApplicationController
  def show(building_id)
    @building = Building.find(building_id)
  end
end
