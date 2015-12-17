json.array!(@users) do |user|
  json.extract! user, :id, :name, :phone_no, :email, :image, :role, :password, :password_confirmation, student_name, classroom
  json.url user_url(user, format: :json)
end
