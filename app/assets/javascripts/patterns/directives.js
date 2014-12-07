jimjam.directive('patternForm', function() {
  return {
    controller: 'PatternFormCtrl',
    restrict: 'E',
    scope: { pattern: '=', patterns: '=' },
    templateUrl: 'assets/templates/patterns/form.html'
  }
});
