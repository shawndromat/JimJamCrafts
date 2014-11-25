jimjam.controller('PatternCtrl', ['$scope', 'Pattern', function($scope, Pattern) {
  $scope.pattern = new Pattern({name: "Mini Poop Emoji"});

  Pattern.getAll().then(function(patterns) {
    $scope.patterns = patterns;
  });
}])
