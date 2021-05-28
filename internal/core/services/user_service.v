module services

import utils { hash_password }
import domain { User }
import ports { IUserRepository }
import errors { invalid_credentials }

pub fn new_user_service(user_repository IUserRepository) &UserService {
	return &UserService {
		user_repository: user_repository
	}
}

struct UserService {
	user_repository IUserRepository
}

pub fn (service &UserService) authenticate(email string, password string) ?string {
	user := service.user_repository.get_by_email(email)?

	if hash_password(password)? != user.password {
		return invalid_credentials('The given credentials were incorrect!')
	}

	//TODO: create jwt
	return "TOKEN"
}

pub fn (service &UserService) create_user(email string, first_name string, last_name string, password string, class string) ?User {
	user := User {
		email: email,
		first_name: first_name,
		last_name: last_name,
		password: hash_password(password)?,
		class: class
	}

	service.user_repository.save_user(&user)?
	return user
}