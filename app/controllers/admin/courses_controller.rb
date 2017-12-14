module Admin
  class CoursesController < ApplicationController

    before_action :set_course, only: [:show, :edit, :update, :destroy]

    permits :title, :code, :study_type, :language

    def index
      @courses = Course.all
    end

    def show
    end

    def new
      @course = Course.new
    end

    def edit
    end

    def create(course)
      @course = Course.new(course)

      if @course.save
        redirect_to courses_path, notice: 'Course was successfully created.'
      else
        render :new
      end
    end

    def update(course)
      if @course.update(course)
        redirect_to courses_path, notice: 'Course was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @course.destroy
      redirect_to courses_url, notice: 'Course was successfully destroyed.'
    end

    private
    def set_course(id)
      @course = Course.find(id)
    end

  end

end