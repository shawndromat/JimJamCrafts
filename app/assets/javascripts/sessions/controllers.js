jimjam.controller('SessionCtrl',  ['$scope','$rootScope', 'Session', function($scope, $rootScope, Session) {
  $scope.session = new Session();

  $scope.login = function() {
    $scope.session.save().then(function(response) {
      $rootScope.currentUser = new User(response.data);
      
      console.log($rootScope.currentUser);
debugger
    });
  }
}]);
