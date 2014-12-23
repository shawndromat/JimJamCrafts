jimjam.config(['$routeProvider', function ($routeProvider) {
  $routeProvider
    .when('/patterns', {
      templateUrl: "../assets/templates/patterns/index.html",
      controller: 'PatternCtrl'
    })

    .otherwise({
      templateUrl: "assets/templates/home.html",
      controller: 'HomeCtrl'
    }) 

}]);