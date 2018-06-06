package domain

import com.mashape.unirest.http.Unirest
import org.uqbar.xtrest.json.JSONUtils

class MercadoPagosClient {
	extension JSONUtils = new JSONUtils

	def aprobar(DatosPago datosPago) {

		// REQUEST 1
		val startPaymentBody = newHashMap => [
			put("card_number", datosPago.numeroTarjeta)
			put("amount", datosPago.monto)
			put("expiration_year", datosPago.anioExpiracion)
			put("expiration_month", datosPago.mesExpiracion)
			put("name", "APRO")
		]

		val startPaymentResponse = Unirest.post("https://pagosmercado.herokuapp.com/start-payment")
			.header("Content-Type", "application/json")
			.body(startPaymentBody.toJson)
			.asJson();
		
		val token = startPaymentResponse.body.object.getJSONObject("data").getString("token")			
		
		
		// REQUEST 2
		val completePaymentBody = newHashMap => [
			put("amount", datosPago.monto)
			put("token", token)
		]

		val completePaymentResponse = Unirest.post("https://pagosmercado.herokuapp.com/credit-payment")
			.header("Content-Type", "application/json")
			.body(completePaymentBody.toJson)
			.asJson();

		if (completePaymentResponse.status !== 200) {
			throw new Exception(completePaymentResponse.body.object.toString)	
		}
	}

	
}