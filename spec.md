# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - used Sinatra
- [x] Use ActiveRecord for storing information in a database - used ActiveRecord
- [x] Include more than one model class (e.g. User, Post, Category) - has 3 model classes
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - user has_many jedis/lightsabers
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - jedis/lightsabers both belong_to user
- [x] Include user accounts with unique login attribute (username or email) - validates uniqueness of username/email
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - user can create, read, update, and destroy a user/jedi/lightsaber
- [x] Ensure that users can't modify content created by other users - helper methods authorize/authenticate prevent users from making patch/delete requests of jedis/lightsabers that don't belong to them.
- [x] Include user input validations - validates for presence of username/email
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) - displayed to users who try to edit an account/mess with id number/sign up through a URL form.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code - 

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
