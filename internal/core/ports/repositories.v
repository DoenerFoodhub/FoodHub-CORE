module ports

import domain { User, Restaurant }

pub interface IUserRepository {
	// get_by_id is a function that returns a user according to a given user id
	// if the no user with the given id is found, an error will be returned
	get_by_id(id int) ?User

	// get_by_email is a function that returns a user according to a given user id
	// if the no user with the given email is found, an error will be returned
	get_by_email(email string) ?User

	// save_user is a function that stores a given user into the database
	// and returns the id the user was assigned by the database
	save_user(user &User) ?int
}

pub interface IRestaurantRepository {
	// get_all returns all restaurants available also containing all products
	// each restaurant has to offer
	get_all() ?[]Restaurant
}