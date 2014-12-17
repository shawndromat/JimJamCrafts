jimjam.directive('fileUpload', function() {
  return {
    controller: 'FileUploadCtrl',
    restrict: 'E',
    scope: { pattern: '='},
    templateUrl: 'assets/templates/pattern_files/form.html'
  }
})
