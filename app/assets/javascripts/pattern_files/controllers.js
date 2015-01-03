angular.module('PatternFiles.controllers', ['PatternFiles.models'])
.controller('FileUploadCtrl', ['$scope', 'PatternFile', function($scope, PatternFile) {
  $scope.file = new PatternFile({pattern_id: $scope.pattern.id});

  $scope.submitFile = function() {
    var file = $scope.file;
    file.save().then(function() {
      $scope.pattern.pattern_files.push(file);
    })
    $scope.file = new PatternFile({pattern_id: $scope.pattern.id});
  }

  $scope.pickFile = function() {
    filepicker.pick({
      mimetypes: ['application/pdf'],
      services: ['COMPUTER', 'DROPBOX', 'GOOGLE_DRIVE']
    },
    function (Blob) {
      $scope.$apply(function() {
        $scope.file.filepicker_url = Blob.url;
        $scope.file.filename = Blob.filename;
      })
    })
  }
}])
