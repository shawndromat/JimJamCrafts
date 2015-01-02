angular.module('Patterns.controllers', ['Patterns.models', 'PatternFiles.directives', 'Patterns.directives'])
.controller('PatternAdminCtrl', ['$scope', 'Pattern', function($scope, Pattern) {
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

.controller('PatternFormCtrl', ['$scope', 'Pattern', function($scope, Pattern) {
  $scope.submitPattern = function() {
    var pattern = $scope.pattern;
    pattern.save().then(function() {
      $scope.patterns.push(pattern);
    })
    $scope.pattern = new Pattern();
  };
}])
