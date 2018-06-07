class PagosController {

  constructor(PagosMercadoService, ApiService) {
    this.pagosMercado = PagosMercadoService
    this.api = ApiService
    this.factura = new Factura()
  }

  registrarPago() {
    this.pagosMercado
    .iniciarPago(this.factura.pago)
    .then((it) => this.api.crearPago(this.factura, it.data.token))
  }
}
