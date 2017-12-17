class LessonListController < ApplicationController
  def show(building_id)
    @building = Building.includes(rooms: [lessons: [:course, :teacher]]).find(building_id)
  end
end
