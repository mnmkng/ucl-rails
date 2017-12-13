class TeachersController < ApplicationController

  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  permits :first_name, :last_name, :email

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

    if @teacher.save
      redirect_to teachers_path, notice: 'Teacher was successfully created.'
    else
      render :new
    end
  end

  def update(teacher)
    if @teacher.update(teacher)
      redirect_to teachers_path, notice: 'Teacher was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @teacher.destroy
    redirect_to teachers_url, notice: 'Teacher was successfully destroyed.'
  end

  private
  def set_teacher(id)
    @teacher = Teacher.find(id)
  end
  
end
