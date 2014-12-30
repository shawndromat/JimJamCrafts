jimjam.controller('UserCtrl', ['$scope', 'User', function($scope, User) {
  $scope.user = new User();

  $scope.submitUser = function() {
    $scope.user.save().then(function() {
      console.log("hi")
    });
  }
}]);
