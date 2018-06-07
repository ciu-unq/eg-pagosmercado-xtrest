angular.module('pagosmercado', ['ui.router'])
    .service('PagosMercadoService', PagosMercadoService)
    .service('ApiService', ApiService)
    .controller('PagosController', PagosController)
    .config(routes)
    