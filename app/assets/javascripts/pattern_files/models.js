jimjam.factory('PatternFile', ['Model', function(Model) {
  PatternFile = Model({url: 'api/pattern_files'});
  return PatternFile;
}])
