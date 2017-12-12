# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  title      :string
#  code       :string
#  study_type :integer
#  language   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Course < ApplicationRecord

  has_many :lessons
  has_many :teacher_assignments, dependent: :destroy
  has_many :teachers, through: :teacher_assignments
  has_many :student_assignments, dependent: :destroy
  has_many :students, through: :student_assignments

  extend Enumerize

  enumerize :study_type, in: {full_time: 1, part_time: 2}, default: :full_time, scope: true, predicates: true
  enumerize :language, in: {czech: 1, english: 2}, default: :czech, scope: true, predicates: true

end
