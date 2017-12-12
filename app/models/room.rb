# == Schema Information
#
# Table name: rooms
#
#  id          :integer          not null, primary key
#  title       :string
#  code        :string
#  building_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Room < ApplicationRecord
  belongs_to :building
  has_many :lessons

  validates :title, presence: true
  validates :code, presence: true

end
