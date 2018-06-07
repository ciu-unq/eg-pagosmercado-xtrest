class PagosMercadoService {
  constructor($http) {
    this.http = $http
    this.base = "https://pagosmercado.herokuapp.com/"
  }
  
  iniciarPago(pago) {
    return this.http
    .post(this.base + "start-payment", pago)
    .then((res) => res.data)
  }
}

class ApiService {
  constructor($http) {
    this.http = $http
    this.base = "http://localhost:9300/"
  }

  facturas() {
    return this.http
    .get(this.base + "facturas")
    .then((res) => res.data)
  }
  
  crearPago(factura, token) {
    let uri = this.base + "facturas?token=" + token 
    return this.http
    .post(uri, factura)
    .then((res) => res.data)
  }
}