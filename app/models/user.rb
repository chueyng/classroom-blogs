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

class User < ActiveRecord::Base
  has_many :posts
  has_secure_password
  validates :email, :presence => true, :uniqueness => true

  # role = { parents:2, teacher: 1, admin: 0 }
  # # enum :role => [:student, :parents, :teacher, :admin]
  # after_initialize :set_default_role, :if => :new_record?

  # def set_default_role
  #   self.role ||= :parents
  # end

end
