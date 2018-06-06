package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class DatosPago {
	String numeroTarjeta
	Integer monto
	Integer anioExpiracion
	Integer mesExpiracion
	
	def validar() {
		if (numeroTarjeta === null || numeroTarjeta.trim.equals("")) {
			throw new UserException("Debe ingresar número de tarjeta")
		}
		if (monto === null || monto <= 0) {
			throw new UserException("Debe ser un monto positivo")
		}
		if (anioExpiracion === null || anioExpiracion <= 0) {
			throw new UserException("Año incorrecto")
		}
		if (mesExpiracion === null || mesExpiracion <= 0) {
			throw new UserException("Mes incorrecto")
		}
	}
	
}