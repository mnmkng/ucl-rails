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

FactoryBot.define do
  factory :lesson do
    start_at "2017-12-12 21:21:07"
    end_at "2017-12-12 21:21:07"
    duration 1
    room nil
    teacher nil
    course nil
  end
end
