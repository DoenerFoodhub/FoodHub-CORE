module domain

pub struct Order {
	pub:
		id int

	pub mut:
		created_on int
		user_id int
		is_done bool
}