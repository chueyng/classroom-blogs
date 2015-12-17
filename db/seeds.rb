  # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Classroom.destroy_all

# c1 = Classroom.create :name => '1_Green', :year => '2015'
# c2 = Classroom.create :name => '1_Yellow', :year => '2015'

User.destroy_all
u1 = User.create :name => 'Craigsy', :email => 'craigsy@gmail.com', :password => 'chicken', :password_confirmation => 'chicken', :phone_no => '0482823832', :role => 'admin', :student_name => '', :classroom => ''
u2 = User.create :name => 'Jonesy', :email => 'jonesy@gmail.com', :password => 'chicken', :password_confirmation => 'chicken', :phone_no => '0489328332', :role => 'teacher', :student_name => 'Elise', :classroom => '1 Red'
u3 = User.create :name => 'Linda', :email => 'linda@gmail.com', :password => 'chicken', :password_confirmation => 'chicken', :phone_no => '0472393933', :role => 'teacher', :student_name => 'Adam', :classroom => '1 Green'
u4 = User.create :name => 'Angie', :email => 'angie@gmail.com', :password => 'chicken', :password_confirmation => 'chicken', :phone_no => '0472393933', :role => 'parents', :student_name => 'Alyssa', :classroom => '1 Green'

Comment.destroy_all
o1 = Comment.create :content => 'Expect Delays', :user_id => u3.id
o2 = Comment.create :content => 'Have a Safe Trip, Dear', :user_id => u3.id


Post.destroy_all
p1 = Post.create :title => 'Writing Time', :body => 'Write an article about yourself', :user_id => u3.id, :image => 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQv4KVjHjNoet7z-3sPmv_I6MVMTXe4oblEEXuiJdh4SNuRGq27mr884V1h' 
p2 = Post.create :title => 'Reading Time', :body => 'Read a fairy tales story', :user_id => u3.id, :image => 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIAKFsDoeTqZr-fAGVQfqDe-8v0KD7GpyN5IPZGW9oA-Xg97V3'


u3.posts << p2
u3.posts << p1

p1.comments << o1
p1.comments << o2

