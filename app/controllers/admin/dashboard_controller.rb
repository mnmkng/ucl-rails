module Admin
  class DashboardController < AdminController
    def index
    end

    def show
      @counts = [
          Building.count,
          Course.count,
          Lesson.count,
          Room.count,
          Student.count,
          Teacher.count
      ]
    end
  end
end

