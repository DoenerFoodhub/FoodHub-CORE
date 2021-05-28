module repositories

import core.errors { db_error }
import core.domain { User }
import sqlite { DB, Row }
import strconv { parse_int }

struct UserRepository {
	Repository
}

fn (repo &UserRepository) get_by_id(user_id int) ?User {
	query := 'SELECT id, email, first_name, last_name, password, class
			  FROM users WHERE id = ${user_id};'

	row := repo.db.exec_one(query) or { return db_error(err.msg) }
	return parse_user(&row)
}

fn (repo &UserRepository) get_by_email(email string) ?User {
	query := 'SELECT id, email, first_name, last_name, password, class
			  FROM users WHERE email = ${email};'

	row := repo.db.exec_one(query) or { return db_error(err.msg) }

	return parse_user(&row)
}

fn (repo &UserRepository) save_user(user &User) ? {
	query := 'INSERT INTO users(email, first_name, last_name, password, class)
			  VALUES 
				(
				 \'${user.email}\', 
				 \'${user.first_name}\', 
				 \'${user.last_name}\', 
				 \'${user.password}\', 
				 \'${user.class}\'
			   ) RETURNING id;'

	row := repo.db.exec_one(query) or { return db_error(err.msg) }
	user.id = parse_int(row.vals[0], 10, 32)
}

fn parse_user(row &Row) ?User {
	vals := row.vals
	id := parse_int(vals[0], 10, 32)

	return User {
		id: int(id),
		email: vals[1]
		first_name: vals[2],
		last_name: vals[3],
		password: vals[4],
		class: vals[5]
	}
}