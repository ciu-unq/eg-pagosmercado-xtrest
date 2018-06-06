package xtrest

import domain.DatosPago
import domain.MercadoPagosClient
import domain.UserException
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.json.JSONUtils

@Controller
class PagosController {
	extension JSONUtils = new JSONUtils

	@Post('/aprobarPago')
	def Result aprobarPago(@Body String body) {
		try {
			if (body === null || body.trim.equals("")) {
				throw new UserException("Faltan los datos de pago")
			}
			val datosPago = body.fromJson(DatosPago)
			datosPago.validar
			
			new MercadoPagosClient().aprobar(datosPago)
			
			ok(getOkJson("Pago Aprobado"))
		} catch (UserException e) {
			return badRequest(getErrorJson(e.message))
		}
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
