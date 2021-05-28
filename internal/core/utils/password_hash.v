module utils

import crypto.sha256
import errors { hash_error }

pub fn hash_password(password string) ?string {
	mut digest := sha256.new()
	digest.write(password.bytes()) or { return hash_error('Error while hashing password') }
	sum := digest.sum([])
	return sum.hex()
}