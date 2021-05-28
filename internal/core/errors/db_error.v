module errors

pub struct DBError {
	msg string
	code int
}

pub fn db_error(msg string) DBError {
	return DBError {
		msg: msg,
		code: ErrorCodes.DBError
	}
}