module domain

pub struct User {
	pub:
		id int

	pub mut:
		email string
		first_name string
		last_name string
		password string
		class string
}

pub struct Admin {
	pub:
		User
		classes []string
}