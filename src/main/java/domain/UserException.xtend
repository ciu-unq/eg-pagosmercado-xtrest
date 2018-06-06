package domain

import java.lang.RuntimeException

class UserException extends RuntimeException {
	
	new(String msg) { super(msg) }
	
}