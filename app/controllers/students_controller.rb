class StudentsController < ApplicationController

  permits :first_name, :last_name, :email, :study_type

  def index
    @students = Student.all
  end

  def show(id)
    @student = Student.find(id)
  end
  
end
