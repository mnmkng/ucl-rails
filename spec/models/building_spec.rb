# == Schema Information
#
# Table name: buildings
#
#  id         :integer          not null, primary key
#  title      :string
#  code       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Building, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end