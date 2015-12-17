# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :string
#  post_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  def owner?(user)
    user.present? && (self.user_id == user.id)    #user.present: user logged in, self.user_id: comment's user, user.id: log-in user
  end

  def teacher?(user)
    user.present? && (user.role == 'teacher')
  end

  def parent?(user)
    user.present? && (user.role == 'parents')
  end
end
