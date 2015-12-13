json.array!(@users) do |user|
  json.extract! user, :id, :name, :phone_no, :email, :image, :role_id, :pass, :pass_conf
  json.url user_url(user, format: :json)
end
