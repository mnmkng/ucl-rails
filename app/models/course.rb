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
  has_many :teacher_assignments
  has_many :teachers, through: :teacher_assignments
  has_many :student_assignments
  has_many :students, through: :student_assignments

  extend Enumerize

  enumerize :study_type, in: {"Full-time".to_sym => 1, "Part-time".to_sym => 2}, default: "Full-time".to_sym, scope: true, predicates: true
  enumerize :language, in: {Czech: 1, English: 2}, default: :Czech, scope: true, predicates: true

  validates :title, presence: true
  validates :code, presence: true
  validates :study_type, presence: true, numericality: :only_integer

end
