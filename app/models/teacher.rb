# == Schema Information
#
# Table name: teachers
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Teacher < ApplicationRecord
  has_many :lessons, dependent: :nullify
  has_many :teacher_assignments, dependent: :destroy
  has_many :courses, through: :teacher_assignments

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

end
