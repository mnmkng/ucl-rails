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

require 'rails_helper'

RSpec.describe TeacherAssignment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
