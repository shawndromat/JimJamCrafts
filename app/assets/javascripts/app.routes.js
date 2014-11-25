jimjam.config(['$routeProvider', function ($routeProvider) {
  $routeProvider
    .otherwise({
      templateUrl: '../templates/patterns/index.html',
      controller: 'PatternCtrl'
    })
    // .otherwise({
    //   templateUrl: '../templates/home.html',
    //   controller: 'HomeCtrl'
    // }) 
}]);
