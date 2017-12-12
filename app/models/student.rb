class Student < ApplicationRecord

  has_many :student_assignments, dependent: :destroy
  has_many :courses, through: :student_assignments

  extend Enumerize

  enumerize :study_type, in: {full_time: 1, part_time: 2}, default: :full_time, scope: true, predicates: true


end
