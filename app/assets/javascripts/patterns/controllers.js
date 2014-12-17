jimjam.controller('PatternCtrl', ['$scope', 'Pattern', function($scope, Pattern) {
  $scope.pattern = new Pattern();
  $scope.patterns = [];

  Pattern.getAll().then(function(patterns) {
    $scope.patterns = $scope.patterns.concat(patterns);
  });

  $scope.submitFile = function() {
    console.log("in pattern")
  }
}])

jimjam.controller('PatternFormCtrl', ['$scope', 'Pattern', function($scope, Pattern) {
  $scope.submitPattern = function() {
    var pattern = $scope.pattern;
    pattern.save().then(function() {
      $scope.patterns.push(pattern);
      console.log($scope.patterns)
    })
    $scope.pattern = new Pattern();
  };
}])
