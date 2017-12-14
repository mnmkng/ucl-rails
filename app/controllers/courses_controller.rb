class CoursesController < ApplicationController

  permits :title, :code, :study_type, :language

  def index
    @courses = Course.all
  end

  def show(id)
    @course = Course.find(id)
  end

end
