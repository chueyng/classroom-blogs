# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :text
#  phone_no   :text
#  email      :text
#  image      :text
#  pass       :text
#  pass_conf  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  role       :integer
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
