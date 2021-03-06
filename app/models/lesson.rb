# == Schema Information
#
# Table name: lessons
#
#  id         :integer          not null, primary key
#  start_at   :datetime
#  end_at     :datetime
#  duration   :integer
#  room_id    :integer
#  teacher_id :integer
#  course_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Lesson < ApplicationRecord
  belongs_to :room
  belongs_to :teacher
  belongs_to :course

  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :course, presence: true

  def self.day(date)
    translations = {
        Monday: 'Pondělí',
        Tuesday: 'Úterý',
        Wednesday: 'Středa',
        Thursday: 'Čtvrtek',
        Friday: 'Pátek',
        Saturday: 'Sobota',
        Sunday: 'Neděle'
    }
    day = date.strftime('%A')

    translations[day.to_sym]
  end

end
