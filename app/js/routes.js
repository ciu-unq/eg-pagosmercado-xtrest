const routes = ($stateProvider, $urlRouterProvider) => {

  $urlRouterProvider.otherwise("/")

  $stateProvider
    .state('nuevoPago', {
      url: "/",
      templateUrl: "partials/nuevo_pago.html",
      controller: "PagosController as ctrl"
    })

}