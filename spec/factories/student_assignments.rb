# == Schema Information
#
# Table name: student_assignments
#
#  id         :integer          not null, primary key
#  course_id  :integer
#  student_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :student_assignment do
    course nil
    student nil
  end
end
