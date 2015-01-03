angular.module('Downloads.controllers', ['Downloads.models'])
  .controller('DownloadCodeFormCtrl', ['$scope', '$attrs', 'DownloadCode', function($scope, $attrs, DownloadCode) {
    $scope.downloadCode = new DownloadCode({
      pattern_id: $scope.pattern.id
    });

    $scope.generateCode = function() {
      $scope.downloadCode.save().then(function(code) {
        debugger
      })
    }
    
  }])
  .controller('DownloadAdminCtrl', ['$scope', 'DownloadCode', 'Pattern', function($scope, DownloadCode, Pattern) {
    $scope.patterns = [];
    $scope.downloadCodes = [];
    $scope.downloadCode = new DownloadCode();

    Pattern.getAll().then(function(patterns) {
      $scope.patterns = $scope.patterns.concat(patterns);
    });
    DownloadCode.getAll().then(function(codes) {
      $scope.downloadCodes = $scope.downloadCodes.concat(codes);
    });


    $scope.generateCode = function() {
      console.log($scope.downloadCode)
      $scope.downloadCode.save().then(function(code) {
        $scope.downloadCodes.push(code);
      })
    }
    
  }])

  .controller('DownloadHomeCtrl', ['$scope', 'DownloadCode', function ($scope, DownloadCode) {
    $scope.code = '';

    $scope.search = function() {
      DownloadCode.search($scope.code).then(function(response) {
        $scope.downloadCode = new DownloadCode(response.data);
        $scope.pattern = $scope.downloadCode.pattern;
      })
    }
    $scope.downloadFile = function(url) {
      filepicker.exportFile(url, {mimetype:'application/pdf'},
        function(Blob){}); 
    }

  }])
