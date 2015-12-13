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

class User < ActiveRecord::Base
  has_many :posts

  # role = { parents:2, teacher: 1, admin: 0 }
  # # enum :role => [:student, :parents, :teacher, :admin]
  # after_initialize :set_default_role, :if => :new_record?

  # def set_default_role
  #   self.role ||= :parents
  # end

end
