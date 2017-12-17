module Admin
  class LessonsController < AdminController

    before_action :set_lesson, only: [:show, :edit, :update, :destroy]

    permits :start_at, :end_at, :duration, :room_id, :teacher_id, :course_id

    def index
      @lessons = Lesson.includes(:course, :teacher, :room)
    end

    def show
    end

    def new
      @lesson = Lesson.new
    end

    def edit
    end

    def create(lesson)
      @lesson = Lesson.new(lesson)

      if @lesson.save
        redirect_to admin_lessons_path, notice: 'Lesson was successfully created.'
      else
        render :new
      end
    end

    def update(lesson)
      if @lesson.update(lesson)
        redirect_to admin_lessons_path, notice: 'Lesson was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @lesson.destroy
      redirect_to admin_lessons_url, notice: 'Lesson was successfully destroyed.'
    end

    private
    def set_lesson(id)
      @lesson = Lesson.find(id)
    end

  end

end