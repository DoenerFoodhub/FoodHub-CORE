module domain

pub struct Product {
	pub:
		id int

	pub mut:
		name string
		description string
		price f32
		restaurant_id int
}