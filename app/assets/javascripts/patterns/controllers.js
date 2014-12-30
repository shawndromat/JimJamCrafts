jimjam.controller('PatternCtrl', ['$scope', 'Pattern', function($scope, Pattern) {
  $scope.pattern = new Pattern();
  $scope.patterns = [];

  Pattern.getAll().then(function(patterns) {
    $scope.patterns = $scope.patterns.concat(patterns);
  });

  $scope.downloadFile = function(url) {
   filepicker.exportFile(url, {mimetype:'application/pdf'},
      function(Blob){
       console.log(Blob.url);
      }); 
  }

}])

jimjam.controller('PatternFormCtrl', ['$scope', 'Pattern', function($scope, Pattern) {
  $scope.submitPattern = function() {
    var pattern = $scope.pattern;
    pattern.save().then(function() {
      $scope.patterns.push(pattern);
    })
    $scope.pattern = new Pattern();
  };
}])
