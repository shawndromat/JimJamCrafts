angular.module('Downloads.controllers', ['Downloads.models', 'Patterns.models', 'Downloads.directives'])
  .controller('DownloadCodeFormCtrl', ['$scope', '$attrs', 'DownloadCode', function($scope, $attrs, DownloadCode) {
    $scope.downloadCode = new DownloadCode({
      pattern_id: $scope.pattern.id
    });

    $scope.generateCode = function() {
      $scope.downloadCode.save().then(function(code) {
      })
    }
  }])
  .controller('DownloadAdminCtrl', ['$scope', '$location', 'DownloadCode', 'Pattern',  function($scope, $location, DownloadCode, Pattern) {
    $scope.patterns = [];
    $scope.downloadCode = new DownloadCode();
    $scope.downloadCodes = [];
    $scope.number = 1;

    $scope.query = $location.search().query || 'pending';

    Pattern.getAll().then(function(patterns) {
      $scope.patterns = $scope.patterns.concat(patterns);
    });

    DownloadCode.getAll($scope.query).then(function(codes) {
      $scope.downloadCodes = $scope.downloadCodes.concat(codes);
    });


    $scope.generateCode = function(n) {
      var code;

      for(var i = 0; i < n; i++) {
        code = new DownloadCode($scope.downloadCode.attributes);
        code.pattern = _.find($scope.patterns, function(patt) {
          return patt.id === Number(code.pattern_id);
        });

        code.save().then($scope.pushCode(code))
      }
        $scope.downloadCode = new DownloadCode();
    }

    $scope.pushCode = function(code) {
      $scope.downloadCodes.push(code);
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

  .controller('DownloadTabCtrl', ['$scope', 'DownloadCode', function ($scope, DownloadCode) {

    $scope.tabs = ["PENDING", "SENT", "DISABLED"].map(function(status) {
      return {
        title: status.slice(0, 1) + status.slice(1).toLowerCase(),
        filter: status,
        content: status
      };
    });

    $scope.tabs[0].active = true;

    $scope.filterDownloads = function(filter) {
      DownloadCode.getAll(filter).then(function(resp) {
          $scope.downloadCodes = resp;
      })
    }
  }])

  .controller('DownloadItemCtrl', ['$scope', 'DownloadCode', function ($scope, DownloadCode) {

    $scope.updateOrderNumber = function() {
      $scope.download.set({order_number: $scope.orderNumber});
      $scope.download.save().then(function() {
      });
    }

  }])
