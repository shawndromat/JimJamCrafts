jimjam.controller('FileUploadCtrl', ['$scope', 'PatternFile', function($scope, PatternFile) {
  $scope.file = new PatternFile({patternId: $scope.pattern.id});

  $scope.submitFile = function() {
    var file = $scope.file;
    file.save().then(function() {
    })
  }
}])
