package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Factura {
	String servicio
	DatosPago pago
}