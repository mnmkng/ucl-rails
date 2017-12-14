class TeachersController < ApplicationController

  permits :first_name, :last_name, :email

  def index
    @teachers = Teacher.all
  end

  def show(id)
    @teacher = Teacher.find(id)
  end

end
