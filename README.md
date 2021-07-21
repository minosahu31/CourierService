# Ruby on Rails COURIER Management System 
## About this application

This application is created by Sahu Minaketana for COURIER Services. This is a simple Courier management system. <br>
##### Framework: Ruby on Rails 6.1
##### Language : Ruby 3.0.1

## Demo
https://drive.google.com/file/d/1hvWYGxjOksGIaX8UlOFuk-MmMhhzOzrP/view

## Install
- Install all gems by typing this:
```
bundle install
```
- To change Database go to "config/database.yml" and then change database. Default Database is PostgresSQL.

- Migrate Database by typing this:
```
rake db:migrate
```
- Create a admin user by running the seed command
rake db:seed

- Login:
	email: "courier.service@mailinator.com"<br>
	password: "p@ssw0rd"		
	
## Features
- Add order
- Export Order (pdf, excel, csv and etc)
- Edit / Delete Order
- Search Order
- Track order
