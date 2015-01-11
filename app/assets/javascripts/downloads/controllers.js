angular.module('Downloads.controllers', ['Downloads.models', 'Patterns.models'])
  .controller('DownloadCodeFormCtrl', ['$scope', '$attrs', 'DownloadCode', function($scope, $attrs, DownloadCode) {
    $scope.downloadCode = new DownloadCode({
      pattern_id: $scope.pattern.id
    });

    $scope.generateCode = function() {
      $scope.downloadCode.save().then(function(code) {
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
      var code = $scope.downloadCode;
      code.pattern = _.find($scope.patterns, function(patt) {
        return patt.id === Number(code.pattern_id);
      });

      $scope.downloadCode.save().then(function() {
        $scope.downloadCodes.push(code);
      })

      $scope.downloadCode = new DownloadCode();
    }
    
  }])

  .controller('DownloadHomeCtrl', ['$scope', 'DownloadCode', function ($scope, DownloadCode) {
    $scope.code = '';
    $scope.downloadCode;

    $scope.search = function() {
      DownloadCode.search($scope.code).then(function(response) {
        $scope.downloadCode = new DownloadCode(response.data);
        $scope.pattern = $scope.downloadCode.pattern;
        $('#title').addClass('results');
        $scope.errorMessage = undefined;
      },
      function(response) {
        $scope.errorMessage = response.data;
      })
    }

    $scope.downloadFile = function(url) {
      filepicker.exportFile(url, {mimetype:'application/pdf'},
        function(Blob){}); 
    }

  }])
