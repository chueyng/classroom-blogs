#Project 1: Classroom blogs
This blog app is a platform created for parents and teachers to proactively communicate and information sharing in a versatile cyber environment. The parents seamlessly keep in touch with teachers to understand and help improve academic development pertaining to their own children and vice-versa.

[Diagram for here is its] (https://drive.google.com/file/d/0B9JpD5RhuP66NzZ0U3lqQlFpakk/view?usp=sharing)

##Features
1. Each classroom's link will only appeared on main page when teacher has been assigned with user id and classroom name. 
2. Thus far, this application only provide three kind of user roles and each of them has their own access-rights:- 
  1. Admin - Create, Edit and Delete user id, comments and posts. Basically Admin is a super user and able to access all features.
  2. Teacher - Create, Edit, and Delete own post only. Edit own profile but allow comment any classes posts.
  3. Parent - Not allow to create, edit and delete post. Only edit own profile, but allow comment to any blog posts. 
3. Archive List is created to organise a monthly lists of links to blog posts.
4. A confirmation email will be sent to the user who newly sign up and an notification mail for notifying administrator assigning password and user role to the particular user

##Demo
[Try this with Live Preview] (http://classroom-blogs.herokuapp.com)

|     User ID       | User Role | Password | Classroom |
| ------------------| --------- |--------- |-----------|
| craigsy@gmail.com | admin     | chicken  |           |
| jonesy@gmail.com  | teacher   | chicken  |  1 Red    |
| linda@gmail.com   | teacher   | chicken  |  1 Green  |
| angie@gmail.com   | parent    | chicken  |  1 Green  |


##Few things that I've learnt and covered are:

* Ruby on Rail

* CSS

* Postgresql

* Content upload at Heroku web hosting

* Keep the password safely in a separate file (eg. config file)

* Cloudinary for uploading image

* Email configuration

* Create Archive

* Login & session

##Specially Thanks To:
Sylvian shared me about twitter-bootstrap gem which speed up my project's layout. Joel gave me very explicit idea about my draft project's flow, and also guide me how to sort out some routing issues when I was having stuck thought. Jack told me that I should keep email's password into .yml secret file and stated it at gitignore file, where tells Git which files to ignore.

I am new to Ruby on Rail, and I really enjoy the moment of getting know it better in day-to-day basis. There is a lots space to improve my knowledge with this regard specifically on routing modules.

