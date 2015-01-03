angular.module('Patterns.models', ['Utils', 'PatternFiles.models'])
.factory('Pattern', ['Model', '$http', 'PatternFile', function(Model, $http, PatternFile) {
  var url = '/api/patterns/';
  Pattern = Model({url: url});

  Pattern.prototype.parse = function(response) {
    if (response.pattern_files) {
      this.pattern_files = _.map(response.pattern_files, function(file) {
        return new PatternFile(file);
      })
      delete response.pattern_files;
    }
    this.etsy_url = "http://www.etsy.com/listing/" + response.listing_id;
    return response;  
  }

  return Pattern;
}]);
