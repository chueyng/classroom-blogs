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

class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_secure_password
  validates :email, :presence => true, :uniqueness => true
  validates :name, :presence => true, :length => { :minimum => 2 }
end
