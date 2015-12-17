# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  phone_no        :string
#  email           :string
#  image           :string
#  image_two       :string
#  password_digest :string
#  student_name    :string
#  classroom       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  role            :string
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
