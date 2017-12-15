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

  has_many :student_assignments
  has_many :courses, through: :student_assignments

  extend Enumerize

  enumerize :study_type, in: {"Full-time".to_sym => 1, "Part-time".to_sym => 2}, default: "Full-time".to_sym, scope: true, predicates: true

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

end
