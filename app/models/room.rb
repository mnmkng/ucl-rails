# == Schema Information
#
# Table name: rooms
#
#  id          :integer          not null, primary key
#  title       :string
#  code        :string
#  building_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Room < ApplicationRecord
  belongs_to :building
  has_many :lessons, dependent: :nullify

  validates :title, presence: true
  validates :code, presence: true

  def generate_timetable()

    schedules = {}
    # dates are hardcoded to "lock down" the app for evaluation with seed data
    lessons = self.lessons.where(
        'start_at >= :start_at AND end_at <= :end_at',
        {start_at: Date.new(2017,12,12), end_at: Date.new(2017,12,17)}
    )
    current = Services::DaySchedule.new
    lessons.each do |lesson|
      if current.last_day && current.last_day != lesson.start_at.to_date
        arr = current.return_chain
        arr.each do |day_sch|
          schedules[day_sch.day] = day_sch unless day_sch.day.nil?
        end
        current = Services::DaySchedule.new
      end
      current.make_schedule(lesson.start_at,lesson.end_at, lesson.course.title)
    end
    arr = current.return_chain
    arr.each do |day_sch|
      schedules[day_sch.day] = day_sch unless day_sch.day.nil?
    end
    return schedules

  end

end
