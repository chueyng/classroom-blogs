class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone_no
      t.string :email
      t.string :image
      t.string :password_digest
      t.string :student_name
      t.string :classroom
      t.timestamps null: false
    end
  end
end
