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

class StudentAssignment < ApplicationRecord
  belongs_to :course
  belongs_to :student
end
