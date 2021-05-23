pub interface UserRepository {
	get_by_id(id int) ?User
	save_user(user &User) ?int
}