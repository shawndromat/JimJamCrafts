angular.module('Downloads.directives', [])

  .directive('codeGenerator', function() {
    return {
      controller: 'DownloadCodeFormCtrl',
      restrict: 'E',
      scope: { pattern: '=' },
      templateUrl: '../assets/templates/downloads/form.html'
    }
  })
