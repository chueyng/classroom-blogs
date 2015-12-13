# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  name        :text
#  phone_no    :text
#  email       :text
#  image       :text
#  pass_digest :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  role        :text
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
