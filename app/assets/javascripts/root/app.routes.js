jimjam.config(['$routeProvider', function ($routeProvider) {
  $routeProvider
    .otherwise({
      templateUrl: "../assets/templates/downloads/home.html",
      controller: 'DownloadHomeCtrl',
    })
}])
