angular.module('Patterns.controllers', ['Patterns.models', 'PatternFiles.directives', 'Patterns.directives', 'Downloads.directives'])
.controller('PatternAdminCtrl', ['$scope', 'Pattern', function($scope, Pattern) {
  $scope.pattern = new Pattern();
  $scope.patterns = [];

  Pattern.getAll().then(function(patterns) {
    $scope.patterns = $scope.patterns.concat(patterns);
  });

  $scope.downloadFile = function(url) {
   filepicker.exportFile(url, {mimetype:'application/pdf'},
      function(Blob){
      }); 
  }
}])

.controller('PatternShowCtrl', ['$scope', '$routeParams', 'Pattern', function($scope, $routeParams, Pattern) {
  $scope.pattern;
  Pattern.get($routeParams.id).then(function(pattern) {
    $scope.pattern = pattern;
  })
}])

.controller('PatternFormCtrl', ['$scope', 'Pattern', function($scope, Pattern) {
  $scope.submitPattern = function() {
    var pattern = $scope.pattern;
    console.log(pattern);
    pattern.save().then(function() {
      $scope.patterns.push(pattern);
    })
    $scope.pattern = new Pattern();
  };
}])
