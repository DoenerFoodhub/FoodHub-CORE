module errors

pub struct InvalidCredentialsError {
	msg string
	code int
}

pub fn invalid_credentials(msg string) InvalidCredentialsError {
	return InvalidCredentialsError {
		msg: msg,
		code: ErrorCodes.InvalidCredentialsError
	}
}