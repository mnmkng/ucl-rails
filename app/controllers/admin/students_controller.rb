module Admin
  class StudentsController < ApplicationController

    before_action :set_student, only: [:show, :edit, :update, :destroy]

    permits :first_name, :last_name, :email, :study_type

    def index
      @students = Student.all
    end

    def show
    end

    def new
      @student = Student.new
    end

    def edit
    end

    def create(student)
      @student = Student.new(student)

      if @student.save
        redirect_to students_path, notice: 'Student was successfully created.'
      else
        render :new
      end
    end

    def update(student)
      if @student.update(student)
        redirect_to students_path, notice: 'Student was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @student.destroy
      redirect_to students_url, notice: 'Student was successfully destroyed.'
    end

    private
    def set_student(id)
      @student = Student.find(id)
    end

  end

end