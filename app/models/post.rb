# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :string
#  image      :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  def owner?(user)
    user.present? && (self.user_id == user.id)    #user.present: user logged in, self.user_id: post's user, user.id: log-in user
  end

  def teacher?(user)
    user.present? && (user.role == 'teacher')
  end

  def parent?(user)
    user.present? && (user.role == 'parents')
  end
end
