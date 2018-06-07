class PagosController {

  constructor(PagosMercadoService, ApiService) {
    this.pagosMercado = PagosMercadoService
    this.api = ApiService
    this.nuevaFactura()
    this.cargarFacturas()
  }

  nuevaFactura() {
    this.factura = new Factura()
  }

  cargarFacturas() {
    this.api
    .facturas() 
    .then((it) => this.facturas = it)
  }

  registrarPago() {
    this.pagosMercado
    .iniciarPago(this.factura.pago)
    .then((it) => this.api.crearPago(this.factura, it.data.token))
    .then(() => this.nuevaFactura())
    .then(() => this.cargarFacturas())
  }
}
