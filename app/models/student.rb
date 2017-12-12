# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  study_type :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ApplicationRecord

  has_many :student_assignments, dependent: :destroy
  has_many :courses, through: :student_assignments

  extend Enumerize

  enumerize :study_type, in: {full_time: 1, part_time: 2}, default: :full_time, scope: true, predicates: true


end
