module errors

pub struct HashError {
	msg string
	code int
}

pub fn hash_error(msg string) HashError {
	return HashError {
		msg: msg,
		code: ErrorCodes.HashError
	}
}