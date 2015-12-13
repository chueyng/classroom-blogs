class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :name
      t.text :phone_no
      t.text :email
      t.text :image
      t.text :pass
      t.text :pass_conf

      t.timestamps null: false
    end
  end
end
