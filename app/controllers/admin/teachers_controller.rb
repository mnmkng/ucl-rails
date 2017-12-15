module Admin
  class TeachersController < AdminController

    # before_action :set_courses
    before_action :set_teacher, only: [:show, :edit, :update, :destroy]

    permits :first_name, :last_name, :email, course_ids: []

    def index
      @teachers = Teacher.all
    end

    def show
    end

    def new
      @teacher = Teacher.new
    end

    def edit
    end

    def create(teacher)
      @teacher = Teacher.new(teacher)
      # @teacher.courses = @courses

      if @teacher.save
        redirect_to admin_teachers_path, notice: 'Teacher was successfully created.'
      else
        render :new
      end
    end

    def update(teacher)
      # p teacher
      if @teacher.update(teacher)
        redirect_to admin_teachers_path, notice: 'Teacher was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @teacher.destroy
      redirect_to admin_teachers_url, notice: 'Teacher was successfully destroyed.'
    end

    private
    def set_teacher(id)
      @teacher = Teacher.find(id)
    end

    # def set_courses(course_ids)
    #   @courses = Course.find(course_ids)
    # end

  end

end