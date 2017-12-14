class LessonsController < ApplicationController

  permits :start_at, :end_at, :duration, :room_id, :teacher_id, :course_id

  def index
    @lessons = Lesson.all
  end

  def show(id)
    @lesson = Lesson.find(id)
  end
  
end
