package xtrest

import domain.Factura
import domain.PagosMercadoClient
import domain.UserException
import java.util.List
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.json.JSONUtils

@Controller
class PagosController {
	extension JSONUtils = new JSONUtils
	val pagosMercado = new PagosMercadoClient()
	List<Factura> facturas = newArrayList


	@Post('/facturas')
	def Result nuevoPago(String token, @Body String body) {
		try {
			if (body === null || body.trim.equals("")) {
				throw new UserException("Faltan los datos de pago")
			}
			
			val factura = body.fromJson(Factura)
			pagosMercado.validarPago(factura.pago, token)
			facturas.add(factura)
			
			ok(getOkJson("Pago Aprobado"))
		} catch (UserException e) {
			return badRequest(getErrorJson(e.message))
		}
	}
	
	@Get('/facturas')
	def Result pagos() {
		ok(facturas.toJson)
	}
	

    private def String getOkJson(String message) {
        '''{ "ok" : "«message»" }'''
    }

    private def String getErrorJson(String message) {
        '''{ "error" : "«message»" }'''
    }

	def static void main(String[] args) {
		XTRest.start(9300, PagosController)
	}

}
