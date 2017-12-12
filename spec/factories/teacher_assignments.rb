# == Schema Information
#
# Table name: teacher_assignments
#
#  id         :integer          not null, primary key
#  teacher_id :integer
#  course_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :teacher_assignment do
    teacher nil
    course nil
  end
end
