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

class TeacherAssignment < ApplicationRecord
  belongs_to :teacher
  belongs_to :course
end
