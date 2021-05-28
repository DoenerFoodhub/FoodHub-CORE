module repositories

import sqlite { DB }

struct Repository {
	pub:
		db &DB
}