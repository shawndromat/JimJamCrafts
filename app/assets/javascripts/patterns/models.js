jimjam.factory('Pattern', ['Model', '$http', 'PatternFile', function(Model, $http, PatternFile) {
  var url = 'api/patterns/';
  Pattern = Model({url: url});
  
  Pattern.get = function(id) {
    return $http.get(url + id).then(function(response) {
      var pattern = new Pattern(response.data);

      if (response.pattern_files) {
        pattern.files = _.map(response.pattern_files, function(file) {
          return new PatternFile(file);
        })
        delete response.pattern_files;
      }

      return pattern;
    })
  }

  return Pattern;
}]);
