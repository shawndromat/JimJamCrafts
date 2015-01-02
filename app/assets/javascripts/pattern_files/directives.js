angular.module('PatternFiles.directives', ['PatternFiles.controllers'])
.directive('fileUpload', function() {
  return {
    controller: 'FileUploadCtrl',
    restrict: 'E',
    scope: { pattern: '='},
    templateUrl: '../assets/templates/pattern_files/form.html',
    link: function(scope, element, attrs) {
      
      // var filepickerInit = function() {
      //   var input = $(element).find('.upload-picker').get(0)
      //   input.type="filepicker-dragdrop";
      //   filepicker.constructWidget(input);
      // }

      // filepickerInit();
    }
  }
})
